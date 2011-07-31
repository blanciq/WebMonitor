require 'test_helper'
require 'tools/CheckAvailabilityTool'

class CheckAvailabilityToolTest < ActiveSupport::TestCase

  sut = CheckAvailabilityTool.new
  
  test "Site returning response code 200 should be considered available" do
    Net::HTTP.expects(:get_response).returns(Net::HTTPSuccess.new('200', '1.1', ''))
    site = sites(:one)
    result = sut.getRanks([site])
    assert_equal true,  result[site]
  end
  
  test "Site returning 404 error should be considered not available" do
    Net::HTTP.expects(:get_response).returns(Net::HTTPClientError.new('404', '1.1', ''))
    site = sites(:one)
    result = sut.getRanks([site])
    assert_equal false, result[site]
  end
  
  test "Exception while getting response should result in site considered not available" do
    Net::HTTP.expects(:get_response).returns do
      raise Exception
    end
    site = sites(:one)
    result = sut.getRanks([site])
    assert_equal false, result[site]
  end
  
end
