import uuid
import time
import random

from contextlib import contextmanager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import ElementNotVisibleException

from pypom import Page


class BasePage(Page):

    URL_TEMPLATE = '/'
    TEST_DATA = '/tests/testdata/urls.txt'
    CATEGORY = '/tests/testdata/categories.txt'

    _get_page_body_text = (By.TAG_NAME, 'body')

    def __init__(self, selenium, base_url, **url_kwargs):
        super(BasePage, self).__init__(selenium, base_url, **url_kwargs)

    @property
    def get_page_source(self):
        return(self.selenium.page_source)

    def wait_for_url(self, args):
        timeout = 15
        current_url = self.selenium.current_url
        try:
            WebDriverWait(self.selenium, timeout).until(lambda s: \
                args in current_url)
            return True
        except TimeoutException:
            assert not TimeoutException, "Could not find '%s' in %s" % (args.upper(), current_url)
        finally:
            self.selenium.implicitly_wait(timeout)

    def wait_for_paypal(self, *locator):
        count = 0
        timeout = 60
        while not self.is_element_present(*locator):
            count += 1
            if count == timeout:
                raise Exception(
                    'Could not find PayPal button after {} seconds'.format(count))

    def wait_for_ajax(self):
        count = 0
        while count < self.timeout:
            time.sleep(1)
            count += 1
            if self.selenium.execute_script('return jQuery.active == 0'):
                return
        raise Exception('Page timed out after %s seconds' % count)

    def wait_for_dom_complete(self):
        try:
            WebDriverWait(self.selenium, self.timeout).until(lambda s: \
                self.selenium.execute_script('return document.readyState') == 'complete')
            return True
        except TimeoutException:
            assert not TimeoutException, 'Page timed out.'
        finally:
            self.selenium.implicitly_wait(self.timeout)

    def wait_for_page_to_load(self):
        areResourcesDoneScript = "return document.readyState"
        self.wait.until(lambda test: \
            self.selenium.execute_script( \
            areResourcesDoneScript) == 'complete')
        return self

    def fetch_product_link(self, args):
        '''Retrieve product to test from data source'''
        path = settings.CLIENT_TEST_PATHS[args]
        full_path = '%s%s' % (path, self.TEST_DATA)
        with open(full_path, 'r') as linkdata:
            links = linkdata.readlines()
            link = random.choice(links)
            return link.strip()

    def fetch_products(self, args):
        '''Retrieve product to test from data source'''
        path = settings.CLIENT_TEST_PATHS[args]
        full_path = '%s%s' % (path, self.TEST_DATA)
        with open(full_path, 'r') as linkdata:
            links = linkdata.readlines()
            random.shuffle(links)
            return links

    def open_product_page(self, url, client):
        '''Navigate to link retrieved from data file'''
        product_link = self.fetch_product_link(client)
        full_url = url + product_link
        self.selenium.get(full_url)
        self.wait_for_page_to_load()
        return full_url

    def fetch_category(self, args):
        '''Retrieve category to test from data source'''
        path = settings.CLIENT_TEST_PATHS[args]
        full_path = '%s%s' % (path, self.CATEGORY)
        with open(full_path, 'r') as linkdata:
            links = linkdata.readlines()
            link = random.choice(links)
            return link.strip()

    def open_plp(self, args):
        '''Navigate to link retrieved from data file'''
        category = self.fetch_category(args)
        full_url = self.base_url + category
        self.selenium.get(full_url)
        self.wait_for_page_to_load()
        return full_url

    def is_element_visible(self, *locator):
        try:
            return self.selenium.find_element(*locator).is_displayed()
        except (ElementNotVisibleException, NoSuchElementException):
            return False

    @contextmanager
    def wait_for_element(self, element, timeout=30):
        yield
        WebDriverWait(self.selenium, timeout).until(EC.staleness_of(element))

    def wait_for_element_present(self, *locator):
        count = 0
        while not self.is_element_present(*locator):
            count += 1
            if count == self.timeout:
                raise Exception(
                    'Could not find what we were looking for after {} seconds'.format(count))

    def wait_for_element_not_present(self, *locator):
        """Wait for the element at the specified locator to be not present in the DOM."""
        self.selenium.implicitly_wait(0)
        timeout = 30
        try:
            WebDriverWait(self.selenium, timeout).until(lambda s: len(self.find_elements(*locator)) < 1)
            return True
        except TimeoutException:
            assert not TimeoutException, 'Page Timeout'
        finally:
            self.selenium.implicitly_wait(timeout)

    def wait_for_element_visible(self, *locator):
        """Wait for the element at the specified locator to be visible in the browser."""
        count = 0
        timeout = 30
        while not self.is_element_visible(*locator):
            time.sleep(1)
            count += 1
            if count == timeout:
                raise Exception("{} was not visible".format(*locator))

    def wait_until_element_visible(self, element):
        timeout = 30
        self.selenium.execute_script("window.scrollTo(0, 0)")
        WebDriverWait(self.selenium, timeout).until(EC.visibility_of(element))

    def wait_until_element_not_visible(self, *locator):
        timeout = 30
        try:
            self.selenium.execute_script("window.scrollTo(0, 0)")
            WebDriverWait(self.selenium, timeout).until(EC.invisibility_of_element_located(*locator))
        except:
            raise Exception('Page took longer than %s to load.' % timeout)

    def scroll_to(self, element):
        self.selenium.execute_script( \
            'arguments[0].scrollIntoView(true);', element)
        self.force_wait(2)

    def scroll_down(self, page):
        elem = self.selenium.find_element_by_tag_name("body")
        page_downs = page
        while page_downs:
            elem.send_keys(Keys.PAGE_DOWN)
            time.sleep(1)
            page_downs -= 1

    def scroll_up(self, page):
        elem = self.selenium.find_element_by_tag_name("body")
        page_downs = page
        while page_downs:
            elem.send_keys(Keys.PAGE_UP)
            time.sleep(1)
            page_downs -= 1

    def force_wait(self, args):
        '''Wrapper for old time.sleep'''
        try:
            time.sleep(int(args))
        except TimeoutException:
            assert not TimeoutException, 'Page Timeout'
        finally:
            self.selenium.implicitly_wait(self.timeout)

    def is_displayed(self):
        return self.root.is_displayed()

    def select_option(self, value, locator):
        '''Utility for working with dropdown options'''
        dropdown = self.selenium.find_element(*locator)
        option_found = False
        all_options = dropdown.find_elements_by_tag_name('option')
        for option in all_options:
            if option.get_attribute("value") == value:
                option_found = True
                option.click()
                time.sleep(1)
                break
        if option_found is False:
            raise Exception('Option %s was not found, thus not selectable.' % value)

    def find_click_element(self, locator):
        '''Scroll to and click scrolled to element'''
        try:
            self.scroll_to(self.find_element(*locator))
            self.force_wait(1)
            method = self.find_element(*locator)
            method.click()
        except:
            raise Exception('Could not select shipping method')

    def passwd_gen(self):
        alphabet = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        pw_length = 8
        mypw = ''
        for i in range(pw_length):
            next_index = random.randrange(len(alphabet))
            mypw = mypw + alphabet[next_index]
        return mypw

    @property
    def signup_gen(self):
        unique = str(uuid.uuid4())[:8]
        context = {}
        context.update({'first': 'Erik_{num}'.format(num=unique)})
        context.update({'last': 'Marty_{num}'.format(num=unique)})
        context.update({'email': 'erikmarty_{num}@mailinator.com'.format(num=unique)})
        context.update({'password' : self.passwd_gen()})
        return context
