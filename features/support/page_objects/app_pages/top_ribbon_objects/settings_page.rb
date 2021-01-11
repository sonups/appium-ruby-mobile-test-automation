# frozen_string_literal: true

# settings page
class SettingPage
  SIGNOUT = { xpath: "//android.widget.TextView[@text='Sign Out']" }.freeze
  DELETE = { xpath: "//android.widget.TextView[@text='Delete account']" }.freeze
  DIALOG_BOX_SIGNOUT = { xpath: "//android.widget.Button[@text='SIGN OUT']" }.freeze
  DIALOG_BOX_DELETE = { xpath: "//android.widget.Button[@text='YES']" }.freeze
  DELETE_CONFIRM_TEXT_BOX = { xpath: '//android.widget.EditText' }.freeze
  CONFIRM_DELETE_BUTTON = { xpath: "//android.widget.Button[@text='DELETE']" }.freeze

  attr_accessor :driver, :action_helper, :sign_out_dialog_box, :delete_dialog_box, :screen_actions_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
    @screen_actions_helper = ScreenActionsHelper.new(driver)
  end

  def signout
    screen_actions_helper.swipe_down until action_helper.displayed?(SIGNOUT)
    action_helper.click(SIGNOUT)
    dialog_box = DialogBox.new(driver)
    until dialog_box.dialog_box_present?
    end
    raise 'Dialogue box not present on clicking signout' unless dialog_box.dialog_box_present?

    action_helper.click(DIALOG_BOX_SIGNOUT)
  end

  def delete_account
    wait_for_dialog_box
    action_helper.wait_until_element(DIALOG_BOX_DELETE)
    action_helper.click(DIALOG_BOX_DELETE)
    action_helper.type(DELETE_CONFIRM_TEXT_BOX, 'DELETE')
    action_helper.click(CONFIRM_DELETE_BUTTON)
  end

  def wait_for_dialog_box
    screen_actions_helper.swipe_down until action_helper.displayed?(SIGNOUT)
    action_helper.click(DELETE)
    dialog_box = DialogBox.new(driver)
    until dialog_box.dialog_box_present?
    end
    raise 'Dialogue box not present on clicking delete' unless dialog_box.dialog_box_present?
  end

  def get_xpath_(_text)
    driver.find_elements(identifier.keys[0], identifier.values[0])
  end

  # androidx.appcompat.widget.LinearLayoutCompat
  #
  # android.widget.Button // YES and NO
  # FIRST_NAME_LABEL >>
  # FIRST_NAME_TEXT >>
  # LAST_NAME_LABEL >>
  # LAST_NAME_TEXT >>
  #
end
