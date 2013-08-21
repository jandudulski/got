class GamesController < ApplicationController
  respond_to :html, :json

  expose(:games) { Game.includes(results: [:house, :player]).includes(:game_version).order(number: :desc) }
  expose(:game, attributes: :game_params)
  expose(:last_game_number) { Game.maximum(:number) || 0 }

  def index
    respond_to do |format|
      format.html
      format.json { render json: games.extend(GamesRepresenter) }
    end
  end

  def new
    game.number = last_game_number + 1

    respond_with game
  end

  def create
    if game.save
      flash[:success] = "Dodano"
    else
      flash[:alert] = "Dupa"
    end

    respond_with game
  end

  def update
    if game.save
      flash[:success] = "Zapisane"
    else
      flash[:alert] = "Dupa"
    end

    respond_with game
  end

  private

  def game_params
    params.require(:game).permit(:number, :date, :game_version_id, :comment)
  end
end
