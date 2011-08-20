require 'SiteChecker'
class SiteController < ApplicationController
  def show
    begin
      @site = Site.find(params[:id])

      if(@site != nil)
        @site_check = @site.getAllLastChecks
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to welcome_index_path, :notice => "No such site"
    else
      respond_to do |format|
        format.html
      end
    end
  end
end
