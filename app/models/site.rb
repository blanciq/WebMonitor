class Site < ActiveRecord::Base
  has_many :site_checks
  
  def self.getSiteToBeChecked
    Site.order("next_check_date").limit(1).first
  end

  def getAllLastChecks
    tools = Tool.all
    results = tools.each.map do |tool|
      SiteCheck.getLastCheck(self, tool)
    end
    Hash[*(tools.map {|m| m.name}).zip(results).flatten]
  end

end
