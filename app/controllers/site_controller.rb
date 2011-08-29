require 'SiteChecker'
require 'charts/BinaryChart'
class SiteController < ApplicationController
  include Clearance::Authentication
  
  before_filter :authorize
  
  def show
    begin
      @site = Site.find(params[:id])
      if(@site != nil)
        @site_check = @site.getAllLastChecks
        @chart_data = @site.getChartData(15)
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to welcome_index_path, :notice => "No such site"
    else
      respond_to do |format|
        format.html
      end
    end
  end
  
  def custom_sites
    @current_user = current_user
  end
end
