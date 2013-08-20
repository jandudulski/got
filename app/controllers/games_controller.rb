class GamesController < ApplicationController
  respond_to :html, :json

  expose(:games) { Game.includes(results: [:house, :player]).order(number: :desc) }
  expose(:game, attributes: :game_params)

  def index
    respond_to do |format|
      format.html
      format.json { render json: games.extend(GamesRepresenter) }
    end
  end

  def create
    if game.save
      flash[:notice] = "Dodano"
    else
      flash[:alert] = "Dupa"
    end

    respond_with game
  end

  private

  def game_params
    params.require(:game).permit(:date, :game_version_id, :comment)
  end
end
