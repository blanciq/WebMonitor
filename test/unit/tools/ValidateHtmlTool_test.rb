require 'test_helper'
require 'tools/ValidateHtmlTool'
class ValidateHtmlToolTest < ActiveSupport::TestCase
  
  sut = ValidateHtmlTool.new
  
  test "Response 'valid' should result in valid site" do
    Net::HTTP.expects(:get_response).returns(ResponseValid.new)
    site = sites(:one)
    result = sut.getRanks([site])
    print result[site]
    assert_equal :ok, result[site]
  end
  
  test "Response'invalid' should result in invalid site" do
    Net::HTTP.expects(:get_response).returns(ResponseInvalid.new)
    site = sites(:one)
    result = sut.getRanks([site])
    assert_equal :error, result[site]
  end
  
  test "Exception during checking should result in empty state" do
    Net::HTTP.expects(:get_response).returns do
      raise Exception
    end
    site = sites(:one)
    result = sut.getRanks([site])
    assert_equal :unknown, result[site]
  end
  
  private
  
  class ResponseValid
    def body
    <<eos 
<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope">
<env:Body>
<m:markupvalidationresponse env:encodingStyle="http://www.w3.org/2003/05/soap-encoding" xmlns:m="http://www.w3.org/2005/10/markup-validator">
    
    <m:uri>http://www.wp.pl/</m:uri>
    <m:checkedby>http://validator.w3.org/</m:checkedby>
    <m:doctype>-//W3C//DTD XHTML 1.0 Strict//EN</m:doctype>
    <m:charset>utf-8</m:charset>
    <m:validity>true</m:validity>
    <m:errors>
        <m:errorcount>0</m:errorcount>
        <m:errorlist>
          
        </m:errorlist>
    </m:errors>
    <m:warnings>
        <m:warningcount>0</m:warningcount>
        <m:warninglist>
        
        
        </m:warninglist>
    </m:warnings>
</m:markupvalidationresponse>
</env:Body>
</env:Envelope>
eos
      
    end
  end
  
  class ResponseInvalid
    def body
    <<-eos 
<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope xmlns:env="http://www.w3.org/2003/05/soap-envelope">
<env:Body>
<m:markupvalidationresponse
env:encodingStyle="http://www.w3.org/2003/05/soap-encoding" 
xmlns:m="http://www.w3.org/2005/10/markup-validator">
    <m:uri>http://qa-dev.w3.org/wmvs/HEAD/dev/tests/xhtml1-bogus-element.html</m:uri>
    <m:checkedby>http://validator.w3.org/</m:checkedby>
    <m:doctype>-//W3C//DTD XHTML 1.0 Transitional//EN</m:doctype>
    <m:charset>utf-8</m:charset>
    <m:validity>false</m:validity>
    <m:errors>
        <m:errorcount>1</m:errorcount>
        <m:errorlist>
          
            <m:error>
                <m:line>13</m:line>
                <m:col>6</m:col>                                           
                <m:source>  
                <![CDATA[
                  &#60;foo<strong title="Position where error was detected.">&#62;</strong>This phrase is enclosed in a bogus FOO element.&#60;/foo&#62;
                  ]]>
                </m:source>                                           
                <m:explanation>
                  <![CDATA[
                    <p> ... </p<p>
                  ]]>
                </m:explanation>                                           
                <m:messageid>76</m:messageid>                                           
                <m:message>element "foo" undefined</m:message>
            </m:error>
           
        </m:errorlist>
    </m:errors>
    <m:warnings>
        <m:warningcount>0</m:warningcount>
        <m:warninglist>
        
        
        </m:warninglist>
    </m:warnings>
</m:markupvalidationresponse>
</env:Body>
</env:Envelope>
eos

    end
  end


end
