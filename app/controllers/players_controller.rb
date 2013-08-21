class PlayersController < ApplicationController
  respond_to :html, :json

  expose(:players) { Player.includes(:results).order(name: :asc) }
  expose(:player)

  def index
    respond_to do |format|
      format.html
      format.json { render json: players.extend(PlayersRepresenter) }
    end
  end
end
