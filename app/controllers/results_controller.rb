class ResultsController < ApplicationController
  respond_to :json

  expose(:game)
  expose(:results) { game.results }
  expose(:result, attributes: :result_params)

  def new
    result.position = game.results.count + 1

    render json: result.extend(ResultRepresenter)
  end

  def create
    result.save

    respond_with result, location: [game, result], represent_with: ResultRepresenter
  end

  def update
    result.save

    respond_with [game, result]
  end

  private

  def result_params
    params.require(:result).permit(:house_id, :player_id, :position, :comment)
  end
end
