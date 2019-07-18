class CampsitesController < ApplicationController

  def index
    @campsites = Campsite.all
  end

  def show
    @campsite = Campsite.find_by(params[:id])
  end
end
