class HikesController < ApplicationController
  def index
    @hikes = Hike.all
  end
end
