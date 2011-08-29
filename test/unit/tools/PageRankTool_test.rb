require 'test_helper'
require 'tools/PageRankTool'

class PageRankToolTest < ActiveSupport::TestCase

  sut = PageRankTool.new
  
  test "Response page rank 7 should return 7" do
    Net::HTTP.expects(:get_response).returns(OpenStruct.new({ "body" => "Rank_1:1:7" }))
    site = sites(:one)
    
    result = sut.getRanks([site])
    
    assert_equal 7, result[site]
  end
  
  test "Exception while getting response should return -1" do
    Net::HTTP.expects(:get_response).returns do
      raise Exception
    end
    site = sites(:one)
    
    result = sut.getRanks([site])
    
    assert_equal -1, result[site]
  end
  
end
