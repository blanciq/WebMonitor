require 'rufus/scheduler'
require 'SiteChecker'

if Rails.env.production?
  scheduler = Rufus::Scheduler.start_new
  
  scheduler.every '10m' do
    SiteChecker.new.checkLastSite
  end
end
