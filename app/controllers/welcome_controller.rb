class WelcomeController < ApplicationController
  def index
    @sites = Site.all
  end

end
