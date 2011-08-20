class SiteCheck < ActiveRecord::Base
  belongs_to :site
  belongs_to :tool
  
  serialize :result
  
  def self.getLastCheck(site, tool)
    result = SiteCheck.where("site_id = ?", site.id).where("tool_id = ?", tool.id).order("created_at DESC").limit(1).first
    result == nil ? SiteCheck.new(:site_id => site.id, :tool_id => tool.id, :result => :unknown) : result
  end

end
