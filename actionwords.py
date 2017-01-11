from selenium.webdriver.common.by import By

from base import BasePage


class HomePage(BasePage):

    _homepage_logo_locator = (By.CSS_SELECTOR, 'body > div.wrapper > header > div > div > div > div > div > a > img')
    _close_modal_locator = (By.CSS_SELECTOR, '#empuCntnr > div.closeonclick.mw-hide')

    @property
    def logo_is_displayed(self):
        return self.is_element_displayed(*self._homepage_logo_locator)

    def click_hanna_anderson_logo(self):
        old = self.find_element(*self._get_page_body_text)
        self.find_element(*self._close_modal_locator).click()
        self.force_wait(.5)
        self.find_element(*self._homepage_logo_locator).click()
        with self.wait_for_element(old):
            self.find_element(*self._homepage_logo_locator)
