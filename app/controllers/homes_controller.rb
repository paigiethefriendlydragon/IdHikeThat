class HomesController < ApplicationController
  def index
    @parks = Park.all
  end
end
