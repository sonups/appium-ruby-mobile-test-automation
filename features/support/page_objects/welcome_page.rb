# frozen_string_literal: true

# Page object class of initial welcome page
class WelcomePage
  GET_STARTED = { id: 'getstarted_layout' }.freeze
  SEE_HOW_IT_WORKS = { id: 'seehowitwork' }.freeze
  TRY_US_OUT = { id: 'txtTryUsOut' }.freeze
  I_HAVE_AN_ACCOUNT = { id: 'txthaveaccount' }.freeze

  attr_accessor :driver, :action_helper

  def initialize(driver)
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def click_get_started
    action_helper.click(GET_STARTED)
  end

  def click_see_how_it_works
    action_helper.click(SEE_HOW_IT_WORKS)
  end

  def click_try_us_out
    action_helper.click(TRY_US_OUT)
  end

  def click_i_have_an_account
    action_helper.click(I_HAVE_AN_ACCOUNT)
  end

  def wait_until_page_displayed
    action_helper.wait_until_element(GET_STARTED)
    true
  end

  def page_displayed?
    true if action_helper.displayed?(GET_STARTED)
  end
end
