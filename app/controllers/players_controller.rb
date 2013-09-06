class PlayersController < ApplicationController
  expose(:players) { Player.includes(:results).order(name: :asc) }
  expose(:player)

  def index
    render json: players.extend(PlayersRepresenter)
  end

  def show
    render json: player.extend(PlayerRepresenter)
  end
end
