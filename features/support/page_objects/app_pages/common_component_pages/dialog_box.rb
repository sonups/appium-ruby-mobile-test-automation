# frozen_string_literal: true

# android dialog box
class DialogBox
  attr_accessor :driver, :action_helper

  DIALOG_BOX_PRESENCE = { xpath: '//androidx.appcompat.widget.LinearLayoutCompat' }.freeze

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def dialog_box_present?
    @action_helper.displayed?(DIALOG_BOX_PRESENCE)
  end

  def click_element_by_text(identifier, text)
    action_helper.clc(identifier, text).click
  end
end
