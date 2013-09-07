class GamesController < ApplicationController
  respond_to :json

  expose(:games) { Game.includes(results: [:house, :player]).includes(:game_version) }
  expose(:game, attributes: :game_params)
  expose(:default_game_version) { GameVersion.first }

  def index
    render json: games.extend(GamesRepresenter)
  end

  def new
    game.game_version = default_game_version

    render json: game.extend(NewGameRepresenter)
  end

  def edit
    render json: game.extend(GameRepresenter)
  end

  def create
    game.save

    respond_with game, represent_with: GameRepresenter
  end

  def update
    game.save

    respond_with game, represent_with: GameRepresenter
  end

  private

  def game_params
    params.require(:game).permit(:number, :date, :game_version_id, :comment)
  end
end
