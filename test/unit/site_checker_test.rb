require 'test_helper'
require 'SiteChecker'
require 'tools/MockTool'
class SiteCheckerTest < ActiveSupport::TestCase
  
  sut = SiteChecker.new
  
  test "getSiteToCheck should return site with empty next_check_time if such record exist" do
    
    result = sut.getSiteToCheck
    
    assert_equal sites(:siteNotCheckedYet), result
  end
  
  test "getSiteToCheck should return site with oldest next_check_time" do

    sites(:siteNotCheckedYet).destroy
        
    result = sut.getSiteToCheck
    
    assert_equal sites(:one), result
  end
  
  test "check Site should create as many new checks in db, as there are tools available" do
    old_count = SiteCheck.where("site_id = ?", sites(:one).id).count
    tools_count = Tool.all.count
    Kernel.expects(:const_get).times(tools_count).returns(MockTool)
        
    sut.checkSite(sites(:one))
    
    assert_equal tools_count, SiteCheck.where("site_id = ?", sites(:one).id).count - old_count
  end
  
  test "check Site should modify the date of the site next check to the later one" do
    old_date = sites(:one).next_check_date
    tools_count = Tool.all.count
    Kernel.expects(:const_get).times(tools_count).returns(MockTool)
        
    sut.checkSite(sites(:one))
    
    assert old_date < sites(:one).next_check_date
  end

  test "check site should cause checked site not being checked at the next call (in most cases)" do
    tools_count = Tool.all.count
    Kernel.expects(:const_get).times(tools_count).returns(MockTool)
    site_to_check = sut.getSiteToCheck

    sut.checkLastSite
    assert_not_equal site_to_check, sut.getSiteToCheck
  end
end
