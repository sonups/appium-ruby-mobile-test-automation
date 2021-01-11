# frozen_string_literal: true

require 'singleton'
require 'appium_lib'
# Base class handling the appium driver features such as start driver, stop driver, restart automation app .
class BaseDriver
  include Singleton
  attr_accessor :driver

  def initialize
    @driver = nil
  end

  # $port = ENV['PORT'] || 4723

  def create_driver(_configuration)
    @capabilities = YAML.load_file(configuration_file)
  end

  def start_driver
    # binding.pry
    appium_driver = Appium::Driver.new(@capabilities, true)
    @driver = appium_driver.start_driver
    Appium.promote_appium_methods Object
    Appium::Logger.level = Logger::DEBUG
  end

  def start_app
    @driver.start_driver
    set_wait 10 # Restoring implicit wait as unstable without it (some pages take some time to load)
  end

  def stop_app
    @driver.driver_quit
  end

  def restart_app
    stop_app
    start_app
  end
end
