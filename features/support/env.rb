# frozen_string_literal: true

require 'rubygems'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'pry'
require_relative '../support/properties/environments_label'
require 'report_builder'

@port = ENV[Environments::PORT] || 4723
RUBYOPT = '-W:no-deprecated -W:no-experimental'

def props
  YAML.load_file(File.join(File.dirname(__FILE__), '/props.yml'))
end
