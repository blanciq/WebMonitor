class MockTool
    
  def getRanks(sites)
    results = sites.map do |site|
      getRank(site)
    end
    Hash[*sites.zip(results).flatten]
  end

  def getRank(site)
    :error
  end


end
