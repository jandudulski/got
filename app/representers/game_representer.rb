require 'roar/representer/json'

module GameRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

  property :id
  property :date
  property :version
  property :players_count
  property :winner, extend: ResultRepresenter, class: Result

  def version
    self.game_version.name_with_capacity
  end

  def players_count
    self.results.count
  end

  def winner
    self.results.where(position: 1).first
  end

  link :self do
    game_path(self)
  end
end
