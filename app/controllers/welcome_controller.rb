require 'tools/CheckAvailabilityTool'
require 'tools/ValidateHtmlTool'
require 'tools/MockTool'

class WelcomeController < ApplicationController
 
  def index
    @sites = Site.all
    @sites_availability = availability_tool.getRanks(@sites)
    @sites_validity = validate_tool.getRanks(@sites)
  end
  
  def availability_tool
    MockTool.new
  end
  
  def validate_tool
    MockTool.new
  end
    
end
