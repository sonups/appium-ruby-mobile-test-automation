# frozen_string_literal: true

# creat account page
class CreateAccountPage
  EMAIL = { id: 'vivino.web.app.beta:id/edtEmail' }.freeze
  PASSWORD = { id: 'vivino.web.app.beta:id/edtPassword' }.freeze
  CONTINUE_WITH_FACEBOOK = { id: 'vivino.web.app.beta:id/signupwithfacebook_layout' }.freeze
  CONTINUE_WITH_GOOGLE = { id: 'vivino.web.app.beta:id/signupwithgoogle_layout' }.freeze
  NEXT = { id: 'vivino.web.app.beta:id/action_next' }.freeze

  attr_accessor :driver, :action_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def type_email_and_password(email, password)
    action_helper.wait_until_element(EMAIL)
    action_helper.type(EMAIL, email)
    action_helper.type(PASSWORD, password)
    action_helper.click(NEXT)
  end
end
