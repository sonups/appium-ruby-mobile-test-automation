# frozen_string_literal: true

require_relative 'common_component_pages/main_page'
# Page object class of Top list page. This is of the type main page
class TopListPage < MainPage
  TOP_CHARTS_LABEL = { id: 'vivino.web.app.beta:id/txtTopChartsIn' }.freeze
  BEST_WINES_RIGHT_NOW_LABEL = { id: 'vivino.web.app.beta:id/txtComputationalListName' }.freeze
  RIBBON_TEXT = { id: 'vivino.web.app.beta:id/tabanim_toolbar' }.freeze

  attr_accessor :driver, :action_helper

  def initialize(driver)
    super
    @driver = driver
    @action_helper = ActionsHelper.new(driver)
  end

  def wait_until_page_displayed
    action_helper.wait_until_element(RIBBON_TEXT)
    true
  end

  def current_tab_name_equal?(tab_name, param)
    # code here
  end
end
