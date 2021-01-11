# frozen_string_literal: true

# Page to handle Google smart ock alert
class GoogleSmartLockAlertPage
  NONE_OF_ABOVE = { id: 'cancel' }.freeze
  SMART_LOCK_IDENTIFIER = { id: 'freezecredential_picker_layout' }.freeze
  attr_accessor :driver, :action_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def retrieve_context
    action_helper.get_context
  end

  def click_none_of_above_if_alert_present
    action_helper.click(NONE_OF_ABOVE) if action_helper.displayed?(SMART_LOCK_IDENTIFIER)
  end
end
