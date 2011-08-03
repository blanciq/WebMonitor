require 'tools/CheckAvailabilityTool'
require 'tools/ValidateHtmlTool'

class SiteController < ApplicationController
  def show
    begin
      @site = Site.find(params[:id])
      @site_availability = CheckAvailabilityTool.new.getRank(@site)
      @site_validity = ValidateHtmlTool.new.getRank(@site)
    rescue ActiveRecord::RecordNotFound
      redirect_to welcome_index_path, :notice => "No such site"
    else
      respond_to do |format|
        format.html
      end
    end
  end
end
