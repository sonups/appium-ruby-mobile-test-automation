# frozen_string_literal: true

require 'yaml'
require 'pry'
require_relative '../base_driver'
require_relative '../../support/properties/environments_label'

# Implementation of Base driver. More Android specific features can be added the implentation based on requirement
class AndroidDriver < BaseDriver
  attr_reader :capabilities

  ANDROID_CONFIGURATION_FILE = File.join(File.dirname(__FILE__), '../properties/capabilities/android_capabilities.yml')

  def configuration_file
    ANDROID_CONFIGURATION_FILE
  end
end
