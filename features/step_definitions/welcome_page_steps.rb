# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/driver_hook'
require_relative '../../features/support/page_objects/welcome_page'
require_relative '../../features/support/page_objects/create_account_page'
require_relative '../../features/support/page_objects/new_profile_page'

Given(/^I click on (.*) button in WelcomePage$/) do |button|
  welcome_page = WelcomePage.new(DriverHook.driver)
  if welcome_page.page_displayed?
    case button
    when 'Get Started'
      welcome_page.click_get_started
    when 'See how it works'
      welcome_page.click_see_how_it_works
    when 'Try us out'
      welcome_page.click_try_us_out
    when 'I have an account'
      welcome_page.click_i_have_an_account
    else
      raise ArgumentError, 'Please specify a valid button'
    end
  end
end

Given(/^I click on Need a account button if currently in Welcome back page$/) do
  welcome_back_page = WelcomeBackPage.new(DriverHook.driver)
  welcome_back_page.click_need_an_account if welcome_back_page.welcome_back_page?
end

And(/^I type (.*) as email and (.*) as password in welcome page$/) do |email, password|
  welcome_back_page = WelcomeBackPage.new(DriverHook.driver)
  welcome_back_page.type_email_and_password(email, password)
end
