class CampsiteController < ApplicationController

  def index
    @campsites = Campsite.all
  end
end
