require 'test_helper'
require './config/routes.rb'

class RoutingTest < ActionController::TestCase
  test "PathToCustomSiteShouldRunCustomSiteAction" do
    assert_recognizes({"controller" => "custom_sites", "action" => "index"}, "/custom_sites")
  end 
  
  test "SiteCustomSiteShouldGenerateProperPath" do
    assert_generates("/custom_sites", :controller => "custom_sites", :action => "index")
  end
end