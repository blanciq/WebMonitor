require 'rexml/document'
require 'uri'
require 'tools/SoapValidateTool'

class ValidateCssTool < SoapValidateTool
  
  def initialize
    @validation_url_start = "http://jigsaw.w3.org/css-validator/validator?output=soap12&uri="
    @validation_url_end = ""
    @result_xpath = "//m:validity/text()"
    @result_expected = "true"
  end
  
end
