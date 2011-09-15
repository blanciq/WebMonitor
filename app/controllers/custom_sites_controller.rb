class CustomSitesController < ApplicationController
  include Clearance::Authentication
  
  before_filter :authorize
  
  def index
    @site = Site.new
    @sites = current_user.sites
    results = @sites.map do |site|
      site.getAllLastChecks
    end
    @sites_checks = Hash[*@sites.zip(results).flatten]
  end
  
  def add
    @site = Site.new
    @site.name = "asda"
    @site.url = "asda"
    @site.user = current_user
    Site.create(@site)    
    redirect_to "/custom_sites"
  end
end