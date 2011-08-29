require 'test_helper'
require './config/routes.rb'

class RoutingTest < ActionController::TestCase
  test "PathToCustomSiteShouldRunCustomSiteAction" do
    assert_recognizes({"controller" => "site", "action" => "custom_site"}, "/site/custom_site")
  end 
  
  test "SiteCustomSiteShouldGenerateProperPath" do
    assert_generates("/site/custom_site", :controller => "site", :action => "custom_site")
  end
end