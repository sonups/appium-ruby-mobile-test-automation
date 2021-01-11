# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/driver_hook'
require_relative '../../features/support/page_objects/welcome_page'
require_relative '../../features/support/page_objects/create_account_page'
require_relative '../../features/support/page_objects/new_profile_page'

And(/^I logout from the application if already logged in$/) do
  top_list_page = TopListPage.new(DriverHook.driver)
  if top_list_page.logged_in?
    top_list_page.launch_settings
    settings_page = SettingPage.new(DriverHook.driver)
    settings_page.signout
    welcome_back_page = WelcomeBackPage.new(DriverHook.driver)
    raise 'Welcome back page not displayed' unless welcome_back_page.wait_until_page_displayed
  else
    welcome_page = WelcomePage.new(DriverHook.driver)
    raise 'Welcome page not displayed' unless welcome_page.wait_until_page_displayed
  end
end

And(/^I delete account if already logged in$/) do
  top_list_page = TopListPage.new(DriverHook.driver)
  if top_list_page.logged_in?
    top_list_page.launch_settings
    settings_page = SettingPage.new(DriverHook.driver)
    settings_page.delete_account
    welcome_back_page = WelcomeBackPage.new(DriverHook.driver)
    raise 'Welcome back page not displayed' unless welcome_back_page.wait_until_page_displayed
  else
    welcome_page = WelcomePage.new(DriverHook.driver)
    raise 'Welcome back page not displayed' unless welcome_page.wait_until_page_displayed

  end
end

When(/^I open the app and the app's main page is displayed$/) do
  hook = DriverHook.instance
  raise 'Driver not created successfully' unless hook.setup_driver
end
