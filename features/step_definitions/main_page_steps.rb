# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/driver_hook'
require_relative '../../features/support/page_objects/welcome_page'
require_relative '../../features/support/page_objects/create_account_page'
require_relative '../../features/support/page_objects/new_profile_page'

Then(/^I verify the (.*) tab is currently focussed$/) do |tab_name|
  top_list_page = TopListPage.new(DriverHook.driver)
  top_list_page.current_tab_name_equal?(tab_name, 'sds')
end

Then(/^I verify the main page is displayed$/) do
  top_list_page = TopListPage.new(DriverHook.driver)
  raise 'main page not displayed' unless top_list_page.wait_until_page_displayed
end
