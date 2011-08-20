require 'test_helper'

class SiteCheckTest < ActiveSupport::TestCase
  
  test "getLastCheck should return latest result for a site" do
    site = SiteCheck.new(:site_id => 1, :tool_id => 1, :result => :ok)
    site.save!
    
    result = SiteCheck.getLastCheck(sites(:one), tools(:one))
    
    assert_equal site, result
  end
  
  test "getLastCheck should return sitecheck with unknown state where no checks for a site exist" do
    assert_equal [], Site.where("id = -1"), "precondition: no site with id = -1 exist"
    
    result = SiteCheck.getLastCheck({:id => -1}, tools(:one))
    
    assert_equal :unknown, result.result
  end
end
