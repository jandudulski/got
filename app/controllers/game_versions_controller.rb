class GameVersionsController < ApplicationController
  respond_to :json

  expose(:game_versions)

  def index
    render json: game_versions.extend(GameVersionsRepresenter)
  end
end
