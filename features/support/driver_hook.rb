# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/drivers/android_driver'
require_relative '../../features/support/helper_class/actions_helper'

# handler for appium driver - activities like start_driver , stop_driver, restart_driver are implemented
class DriverHook
  include Singleton

  NUMBER_FIELD1 = { accessibility_id: 'inputA' }.freeze

  attr_reader :is_driver_created
  attr_accessor :driver

  def setup_driver
    unless is_driver_created
      @port = { port: '4723' }
      @driver = Class.new(AndroidDriver).instance
      @driver.create_driver(@port)
      @is_driver_created = true
      @driver.start_driver
    end
    is_driver_created
  end

  def launch_app(package, activity)
    @driver.start_activity app_package: package, app_activity: activity
  end

  def tear_down
    LocalDriver.instance.stop_app
  end

  def accept_smark_lock_security
    @port = { port: '4723' }
    smart_lock_driver = Class.new(SmartLockDriver).instance
    smart_lock_driver.create_driver(@port)
    smart_lock_driver.start_driver
  end
end
