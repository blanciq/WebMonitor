require 'test_helper'
require 'SiteChecker.rb'
class SiteTest < ActiveSupport::TestCase
  test "Site with null next_check_date should be checked first" do    
    result = Site.getSiteToBeChecked
    
    assert_equal sites(:siteNotCheckedYet), result
  end
  
  test "Site with the oldest next_check_date should be checked first if no null checks exist" do
    s = sites(:siteNotCheckedYet)
    s[:next_check_date] = '2010-06-09T10:50:13-0700'
    s.save!

    result = Site.getSiteToBeChecked
    
    assert_equal sites(:one), result
  end
  
  test "GetAllResults should return all results for the site" do
    tools_count = Tool.all.count
    Kernel.expects(:const_get).times(tools_count).returns(MockTool)
    site_checker = SiteChecker.new
    site = sites(:one)
    site_checker.checkSite(site)
    
    result = site.getAllLastChecks
    
    assert_equal tools_count, result.size
  end
  
end
