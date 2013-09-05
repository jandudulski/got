class PlayersController < ApplicationController
  respond_to :html, :json
  layout false

  expose(:players) { Player.includes(:results).order(name: :asc) }
  expose(:player)

  def index
    respond_to do |format|
      format.html
      format.json { render json: players.extend(PlayersRepresenter) }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: player.extend(PlayerRepresenter) }
    end
  end
end
