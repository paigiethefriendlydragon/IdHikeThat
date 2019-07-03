class Api::V1::CampsitesController < ApplicationController

  def index
    render json: Campsite.all
  end
end
