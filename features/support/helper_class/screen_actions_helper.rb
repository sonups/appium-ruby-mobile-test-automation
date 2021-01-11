# frozen_string_literal: true

# Helper class to simulate hide keyboard, swipe down, swipe up, swipe from element etc.
class ScreenActionsHelper
  def initialize(driver)
    @driver = driver
  end

  def find(locator_type, locator)
    driver.find_element(locator_type, locator)
  end

  def hide_keyboard
    @driver.hide_keyboard if @driver.is_keyboard_shown
  end

  def swipe_down
    action = Appium::TouchAction.new.swipe(start_x: 300, start_y: 700, end_x: 300, end_y: 200, duration: 500)
    action.perform
  end

  def swipe_up
    action = Appium::TouchAction.new.swipe(start_x: 300, start_y: 700, end_x: 300, end_y: 200, duration: 500)
    action.perform
  end

  def swipe_down_from_element(element)
    execute_script 'mobile: scroll', direction: 'down', element: element
  end
end
