# frozen_string_literal: true

require 'pry'
require_relative '../../features/support/drivers/android_driver'
require_relative '../../features/support/helper_class/actions_helper'
require_relative 'time_module'
require 'report_builder'

# Before do |scenario|
#   scenario_name = scenario.name
# end
#
# After do |scenario|
#   feature_name = scenario.name
# end

at_exit do
  ReportBuilder.configure do |config|
    file_name = time_now
    config.input_path = 'results/json'
    config.report_path = "results/report/execution_report_#{file_name}"
    config.report_types = %i[retry html]
    config.report_title = 'My Test Results'
  end
  ReportBuilder.build_report
end
