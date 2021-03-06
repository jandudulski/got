require 'roar/representer/json'

module GameRepresenter
  include Roar::Representer::JSON

  property :id
  property :date
  property :game_version, extend: GameVersionRepresenter
  property :game_version_id
  collection :results, extend: ResultRepresenter
  property :players_count
  property :winner, extend: ResultRepresenter
  property :comment
  property :edit
  property :created_at

  def edit
    false
  end

  def players_count
    self.results.size
  end

  def winner
    self.results.find { |r| r.position == 1 }
  end
end
