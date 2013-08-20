class GamesController < ApplicationController
  respond_to :html, :json

  expose(:games) { Game.includes(results: [:house, :player]).includes(:game_version).order(number: :desc) }
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

  def update
    if game.save
      flash[:notice] = "Zapisane"
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
