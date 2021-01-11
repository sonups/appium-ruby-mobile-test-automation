# frozen_string_literal: true

# Helper class to simulate click, capture text, clear text, type appium actions
class ActionsHelper
  def initialize(driver)
    @driver = driver
  end

  def visit(url = '/')
    driver.get(ENV['base_url'] + url)
  end

  def find(locator_type, locator)
    driver.find_element(locator_type, locator)
  end

  def find_element(identifier)
    driver.find_element(identifier.keys[0], identifier.values[0])
  end

  def find_element_by_text(identifier, _text)
    driver.find_elements(identifier)
  end

  def find_elements(identifier)
    driver.find_elements(identifier.keys[0], identifier.values[0])
  end

  def wait_until(identifier)
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { driver.find_element(identifier).displayed? }
  end

  def clear(identifier)
    find_element(identifier).clear
  end

  def type(identifier, input)
    find_element(identifier).send_keys input
  end

  def click(identifier)
    find(identifier.keys[0], identifier.values[0]).click
  end

  def displayed?(identifier)
    find(identifier.keys[0], identifier.values[0]).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def text_of(identifier)
    find_element(identifier).text
  end

  def title
    driver.title
  end

  def retrieve_context
    driver.get_context
  end

  def wait_for(seconds = 5, &block)
    Selenium::WebDriver::Wait.new(timeout: seconds).until(&block)
  end

  def wait_until_element(identifier)
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { find(identifier.keys[0], identifier.values[0]).displayed? }
  end
end
