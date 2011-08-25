require 'tools/CheckAvailabilityTool'
require 'tools/ValidateHtmlTool'
require 'tools/ValidateCssTool'

class SiteChecker
  
  def checkLastSite
    site = getSiteToCheck
    if(site != nil)
      checkSite(site)
    end
  end

  def checkSite(site)
    date = DateTime.current
    Tool.all.each do |tool|
      toolInstance = Kernel.const_get(tool.classname).new
      result = toolInstance.getRank(site)
      SiteCheck.new(:site => site, :tool => tool, :result => result).save!
    end
    site.next_check_date = date + site.checking_period
    site.save!
  end
  
  def getSiteToCheck
    nonCheckedSites = Site.where("next_check_date isnull")
    if nonCheckedSites.any? then
      nonCheckedSites.first
    else
      now = DateTime.current
      (Site.all.select { |site| site.next_check_date < now }).min_by { |site| site.next_check_date }
    end
  end

end
