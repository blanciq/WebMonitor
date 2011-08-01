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
      :ok if (Net::HTTP.get_response URI.parse(site.url)).kind_of? Net::HTTPSuccess
    rescue
      :error
    end
  end

end
