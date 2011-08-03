require 'net/http'
require 'uri'

class CheckAvailabilityTool
    
  def getRanks(sites)
    results = sites.map do |site|
      getRank(site)
    end
    Hash[*sites.zip(results).flatten]
  end

  def getRank(site)
    checkAvailability(site)
  end

  private
  
  def checkAvailability(site)
    begin
      response = Net::HTTP.get_response URI.parse(site.url)
      ((response.kind_of? Net::HTTPSuccess) || (response.kind_of? Net::HTTPRedirection)) ? :ok : :error
    rescue
      :error
    end
  end

end
