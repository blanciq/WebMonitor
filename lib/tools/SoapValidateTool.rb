require 'rexml/document'
require 'uri'

class SoapValidateTool
  
  def initialize
    
    @validation_url_start = "http://bad-address.com/?aa="
    @validation_url_end = "&bb=cc"
    @result_xpath = "//somepath/text()"
    @result_expected = "ok"
    raise "You can't initialize this class, try derived classes"
  end
  
  def getRanks(sites)
    results = sites.map do |site|
      getRank(site)
    end
    Hash[*sites.zip(results).flatten]
  end
  
  def getRank(site)
    validateSite(site)
  end

  private
  
  def validateSite(site)
    begin
      url = createUrl(site.url);
      xml_data = (Net::HTTP.get_response(url)).body
      doc = REXML::Document.new(xml_data)
      result = REXML::XPath.first(doc, @result_xpath)
      result == @result_expected ? :ok : :error
    rescue Exception
      :unknown
    end
  end

  def createUrl(siteAddress)
    return URI.parse(@validation_url_start + URI.escape(siteAddress) + @validation_url_end)
  end
  
end
