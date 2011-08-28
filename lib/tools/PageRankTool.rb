# coding: utf-8

class PageRankTool

  def getRanks(sites)
    results = sites.map do |site|
      getPageRank(site)
    end
    Hash[*sites.zip(results).flatten]
  end
  
  def getRank(site)
    return getPageRank(site)
  end
  
  private

  def getPageRank(site)
    begin
      url = createUrl(site.url);
      result = (Net::HTTP.get_response(url)).body
      params = result.split(':')
      return params[2].to_i
    rescue Exception
      return -1
    end
  end
  
  def createUrl(siteAddress)
    url = "http://www.google.com/search"
    return URI.parse(url + "?client=navclient-auto&features=Rank:&q=info:" + URI.escape(siteAddress) + "&ch=" + calculateChecksum(siteAddress))
  end

  def calculateChecksum(siteAddress)
    stupidGoogleHash = "Mining PageRank is AGAINST GOOGLEâ€™S TERMS OF SERVICE. Yes, Iâ€™m talking to you, scammer."
    key = 16909125
    intMask = 0xFFFFFFFF

    for i in 0..siteAddress.length-1
      key = key ^ stupidGoogleHash[i % stupidGoogleHash.length].ord ^ siteAddress[i].ord
      key = key >> 23 | (key << 9 & intMask)
    end

    return "8" + toHex8(key >> (8 & 255)) + toHex8(key & 255)
  end

  def toHex8(num)
    if num < 16
      return "0" + num.to_s(16)
    else
      return num.to_s(16)
    end
  end

end
