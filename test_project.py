import pytest

from actionwords import HomePage


@pytest.mark.logo
@pytest.mark.nondestructive
def test_Logo_is_visible(base_url, selenium):
    page = HomePage(selenium, base_url).open()
    assert page.logo_is_displayed, \
        'Homepage logo not displayed.'

@pytest.mark.click
@pytest.mark.nondestructive
def test_user_can_click_hanna_andersson_logo_to_go_to_homepage(base_url, selenium):
    # TODO: Implement action: "Go to Homepage"
    # TODO: Implement action: "Click Hanna Andersson logo
    # "
    # TODO: Implement action: "User is brought to Hanna Andersson Homepage"
    page = HomePage(selenium, base_url).open()
    page.click_hanna_anderson_logo()


