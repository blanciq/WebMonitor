require 'tools/CheckAvailabilityTool'
require 'tools/ValidateHtmlTool'
class WelcomeController < ApplicationController
  def index
    @sites = Site.all
    @sites_availability = CheckAvailabilityTool.new.getRanks(@sites)
    @sites_validity = (ValidateHtmlTool.new).getRanks(@sites)
  end

end
