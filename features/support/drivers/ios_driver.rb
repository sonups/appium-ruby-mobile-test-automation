# frozen_string_literal: true

require 'yaml'
# require_relative '../local_driver'
# require_relative '../../properties/run_properties'
# require_relative '../../properties/environments'

# Implementation of Base driver
class IosDriver < BaseDriver
  attr_reader :capabilities

  IOS_CONFIGURATION_FILE = File.join(File.dirname(__FILE__), '../../properties/capabilities/ios_capabilities.yml')

  def create_driver(configuration)
    super
    @execution_device = configuration[:execution_device]
    prepare_capabilities(configuration[:device])
    @capabilities
  end

  def configuration_file
    IOS_CONFIGURATION_FILE
  end

  def prepare_capabilities(device)
    @capabilities[:caps][:app] = @app
    @capabilities[:caps][:device] = device
  end
end
