class HousesController < ApplicationController
  respond_to :json

  expose(:houses)

  def index
    render json: houses.extend(HousesRepresenter)
  end
end
