require 'roar/representer/json'

module ResultRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

  property :id
  property :player, extend: PlayerRepresenter
  property :house, extend: HouseRepresenter
  property :position
end
