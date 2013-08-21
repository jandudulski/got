require 'roar/representer/json'

module PlayerRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

  property :id
  property :name
  property :games_count
  property :avg_position

  def games_count
    self.results.size
  end

  def avg_position
    self.results.average(:position).round(2)
  end
end
