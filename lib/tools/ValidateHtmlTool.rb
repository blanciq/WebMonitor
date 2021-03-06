require 'rexml/document'
require 'uri'
require 'tools/SoapValidateTool'

class ValidateHtmlTool < SoapValidateTool
  
  def initialize
    @validation_url_start = "http://validator.w3.org/check?output=soap12&url="
    @validation_url_end = ""
    @result_xpath = "//m:validity/text()"
    @result_expected = "true"
  end
  
end
