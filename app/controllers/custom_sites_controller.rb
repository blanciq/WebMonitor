class CustomSitesController < ApplicationController
  include Clearance::Authentication
  
  before_filter :authorize
  
  def index
    @sites = current_user.sites
    results = @sites.map do |site|
      site.getAllLastChecks
    end
    @sites_checks = Hash[*@sites.zip(results).flatten]
  end
  
  def add
    site = Site.new(:name => params[:name], :url => params[:url], :user => current_user)
    site.save    
    redirect_to "/custom_sites"
  end
end