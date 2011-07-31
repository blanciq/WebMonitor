require 'rexml/document'
require 'tools/HTMLValidity'
require 'uri'

class ValidateHtmlTool
  
  def getRanks(sites)
    results = sites.map do |site|
      validateSite(site)
    end
    Hash[*sites.zip(results).flatten]
  end
  
  private
  
  def validateSite(site)
    begin
      url = createUrl(site.url);
      xml_data = (Net::HTTP.get_response(url)).body
      doc = REXML::Document.new(xml_data)
      result = REXML::XPath.first(doc, "//m:validity/text()")
      HTMLValidity.new(result == "true" ? HTMLValidity::VALID : HTMLValidity::INVALID)
    rescue Exception
      HTMLValidity.new(HTMLValidity::UNKNOWN)
    end
  end

  def createUrl(siteAddress)
    validatorUrl = "http://validator.w3.org/check"
    return URI.parse(validatorUrl + "?output=soap12&url=" + URI.escape(siteAddress))
  end
  
end
