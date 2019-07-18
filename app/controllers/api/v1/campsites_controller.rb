class Api::V1::CampsitesController < ApplicationController

  def index
    render json: Campsite.all
  end

  def show
    render json: Campsite.find_by(params[:id])
  end
end
