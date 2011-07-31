require 'net/http'
require 'uri'

class CheckAvailabilityTool
    
  def getRanks(sites)
    results = sites.map do |site|
      checkAvailability(site)
    end
    Hash[*sites.zip(results).flatten]
  end

  private
  
  def checkAvailability(site)
    begin
      (Net::HTTP.get_response URI.parse(site.url)).kind_of? Net::HTTPSuccess
    rescue
      false
    end
  end

end
