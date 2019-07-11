class Api::V1::HikesController < ApplicationController

  def index
    render json: Hike.all
  end
end
