require 'tools/CheckAvailabilityTool'

class WelcomeController < ApplicationController
  def index
    @sites = Site.all
    @sites_availability = CheckAvailabilityTool.new.getRanks(@sites)
  end

end
