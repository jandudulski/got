require 'roar/representer/json'

module GameRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

  property :id
  property :number
  property :date
  property :version
  property :players_count
  property :winner, extend: ResultRepresenter, class: Result

  def version
    self.game_version.name_with_capacity
  end

  def players_count
    self.results.size
  end

  def winner
    self.results.find { |r| r.position == 1 }
  end

  link :self do
    game_path(self)
  end
end
