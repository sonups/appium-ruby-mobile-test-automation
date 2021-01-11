# frozen_string_literal: true



THREE_DOTS = { xpath: "//android.view.ViewGroup[@resource-id='vivino.web.app.beta:id/tabanim_toolbar']/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ImageView" }.freeze
SETTINGS = { xpath: "//android.widget.TextView[@text='Settings']" }.freeze
PAGE_TITLE_LABEL = { class: 'android.widget.TextView' }.freeze

# base page of vivino app. Top list, Search, Friends, My profile can derive from this base page
class MainPage
  attr_accessor :driver, :action_helper, :screen_actions_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
    @screen_actions_helper = ScreenActionsHelper.new(driver)
  end

  def logged_in?
    action_helper.displayed?(THREE_DOTS)
  end

  def launch_settings
    screen_actions_helper.hide_keyboard
    action_helper.click(THREE_DOTS)
    action_helper.wait_until_element(SETTINGS)
    action_helper.click(SETTINGS)
  end
end
