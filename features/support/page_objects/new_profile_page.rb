# frozen_string_literal: true

# new profile page
class NewProfilePage
  DONE_BUTTON = { id: 'vivino.web.app.beta:id/action_done' }.freeze
  FIRST_NAME = { id: 'vivino.web.app.beta:id/edtUserName' }.freeze
  LAST_NAME = { id: 'vivino.web.app.beta:id/edtUserSurname' }.freeze
  ADD_PHOTO = { id: 'vivino.web.app.beta:id/txt_addPhoto' }.freeze
  ACCEPT_TERMS = { id: 'vivino.web.app.beta:id/new_profile_agree_terms' }.freeze

  attr_accessor :driver, :action_helper, :screen_actions_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
    @screen_actions_helper = ScreenActionsHelper.new(driver)
  end

  def type_first_name_and_last_name(first_name, last_name)
    action_helper.wait_until_element(FIRST_NAME)
    action_helper.type(FIRST_NAME, first_name)
    action_helper.type(LAST_NAME, last_name)
  end

  def accept_terms_and_proceed
    screen_actions_helper.hide_keyboard
    action_helper.wait_until_element(ACCEPT_TERMS)
    action_helper.click(ACCEPT_TERMS)
    action_helper.wait_until_element(DONE_BUTTON)
    action_helper.click(DONE_BUTTON)
  end
end
