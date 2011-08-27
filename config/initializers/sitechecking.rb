require 'rufus/scheduler'
require 'SiteChecker'

if Rails.env.production?
  scheduler = Rufus::Scheduler.start_new
  
  scheduler.every '1m' do
    SiteChecker.new.checkLastSite
  end
end
