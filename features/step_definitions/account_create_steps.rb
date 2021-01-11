# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/driver_hook'
require_relative '../../features/support/page_objects/welcome_page'
require_relative '../../features/support/page_objects/create_account_page'
require_relative '../../features/support/page_objects/new_profile_page'

And(/^I type (.*) as email and (.*) as password in create account page$/) do |email, password|
  create_account_page = CreateAccountPage.new(DriverHook.driver)
  create_account_page.type_email_and_password(email, password)
end

And(/^I type auto-generated email with below password in create account page$/) do |table|
  @data = table.hashes
  data_at_first_row = @data[0]
  password = data_at_first_row['Password']
  create_account_page = CreateAccountPage.new(DriverHook.driver)
  t = Time.now
  random_email = "#{t.hour}#{t.min}#{t.sec}@gmail.com"
  create_account_page.type_email_and_password(random_email, password)
end

And(/^I type (.*) as First name and (.*) as Last Name in New profile page$/) do |first_name, last_name|
  new_profile_page = NewProfilePage.new(DriverHook.driver)
  new_profile_page.type_first_name_and_last_name(first_name, last_name)
end

And(/^I ensure to accept terms and proceed from New profile page$/) do
  new_profile_page = NewProfilePage.new(DriverHook.driver)
  new_profile_page.accept_terms_and_proceed
end
