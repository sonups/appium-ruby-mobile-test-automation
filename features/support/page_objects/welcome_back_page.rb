# frozen_string_literal: true

# Page object class of welcome back page after sign-out
class WelcomeBackPage
  EMAIL = { id: 'vivino.web.app.beta:id/edtEmail' }.freeze
  PASSWORD = { id: 'vivino.web.app.beta:id/edtPassword' }.freeze
  CONTINUE_WITH_FACEBOOK = { id: 'vivino.web.app.beta:id/signupwithfacebook_layout' }.freeze
  CONTINUE_WITH_GOOGLE = { id: 'vivino.web.app.beta:id/signupwithgoogle_layout' }.freeze
  LOG_INT = { id: 'vivino.web.app.beta:id/action_signin' }.freeze
  NEED_AN_ACCOUNT = { xpath: "//android.widget.Button[@text='Need a new account?']" }.freeze

  attr_accessor :driver, :action_helper, :screen_actions_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
    @screen_actions_helper = ScreenActionsHelper.new(driver)
  end

  def type_email_and_password(email, password)
    action_helper.wait_until_element(EMAIL)
    action_helper.type(EMAIL, email)
    action_helper.type(PASSWORD, password)
    action_helper.click(LOG_INT)
  end

  def wait_until_page_displayed
    action_helper.wait_until_element(EMAIL)
    true
  end

  def welcome_back_page?
    screen_actions_helper.hide_keyboard
    action_helper.displayed?(NEED_AN_ACCOUNT)
  end

  def click_need_an_account
    screen_actions_helper.hide_keyboard
    action_helper.wait_until_element(NEED_AN_ACCOUNT)
    action_helper.click(NEED_AN_ACCOUNT)
    true
  end
end
