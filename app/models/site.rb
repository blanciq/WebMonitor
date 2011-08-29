class Site < ActiveRecord::Base
  has_many :site_checks
  belongs_to :user
  
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
  
  def getChartData(num_of_checks)
    tools = Tool.all
    chartData = tools.each.map do |tool|
      SiteCheck.where("site_id = ? and tool_id = ?", self.id, tool.id).limit(num_of_checks)
    end
    Hash[*(tools.map {|m| m.name}).zip(chartData).flatten(1)]
  end

end
