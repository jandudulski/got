require 'roar/representer/json'

module HouseRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

  property :id
  property :name
  property :icon

  def icon
    self.name.downcase
  end
end
