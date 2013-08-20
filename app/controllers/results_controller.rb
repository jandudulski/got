class ResultsController < ApplicationController
  respond_to :html

  expose(:game)
  expose(:results) { game.results }
  expose(:result, attributes: :result_params)

  def new
    result.position = game.results.count + 1

    respond_with result
  end

  def create
    result.save

    respond_with result, location: game
  end

  def update
    result.save

    respond_with result, location: game
  end

  private

  def result_params
    params.require(:result).permit(:house_id, :player_id, :position, :comment)
  end
end
