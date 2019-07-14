class Api::V1::ParksController < ApplicationController

  def index
    render json: Park.all
  end

  def search
    @parks = Park.where("name ILIKE ? OR description ILIKE ?", "%#{params['search_string']}%", "%#{params['search_string']}%")
    render json: @parks
  end

  def show
    render json: Park.find(params[:id])
  end
end
