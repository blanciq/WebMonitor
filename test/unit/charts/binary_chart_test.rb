require 'test_helper'
require 'charts/BinaryChart'

class ValidateHtmlToolTest < ActiveSupport::TestCase
  
  sut = BinaryChart.new(nil, nil, nil, nil, nil, nil)
  
  test "Get dates check" do
    result = sut.get_dates(site_checks_collection)
    assert_equal ['09.06', '11.06', '16.06', '20.06', '25.06'], result
  end
  
  test "Get results check" do
    result = sut.get_results(site_checks_collection)
    assert_equal [1, 0, 1, 0, 1], result
  end
  
  test "Clean repeating values" do
    input = ['09.06', '11.06', '11.06', '20.06', '20.06', '21.06']
    result = sut.clean_repeating_values(input)
    assert_equal ['09.06', '11.06', '', '20.06', '', '21.06'], result
  end
  
  def site_checks_collection
    [SiteCheck.new(:result => :ok, :created_at => '2005-06-09T10:50:13-0700'),
     SiteCheck.new(:result => :error, :created_at => '2005-06-11T10:50:13-0700'),
     SiteCheck.new(:result => :ok, :created_at => '2005-06-16T10:50:13-0700'),
     SiteCheck.new(:result => :unknown, :created_at => '2005-06-20T10:50:13-0700'),
     SiteCheck.new(:result => :ok, :created_at => '2005-06-25T10:50:13-0700')
    ]
  end
end
