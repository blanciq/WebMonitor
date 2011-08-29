require 'SiteChecker'

class WelcomeController < ApplicationController
 
  def index
    @publicSites = Site.getPublicSites
    results = @publicSites.map do |site|
      site.getAllLastChecks
    end
    @sites_checks = Hash[*@publicSites.zip(results).flatten]
  end
  
  def update
    siteChecker = SiteChecker.new
    Site.all.each do |site|
      siteChecker.checkSite(site)
    end
    redirect_to welcome_index_path
  end

end
