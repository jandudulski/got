require 'roar/representer/json'

module ResultRepresenter
  include Roar::Representer::JSON

  property :id
  property :player, extend: PlayerRepresenter
  property :house, extend: HouseRepresenter
  property :position
  property :comment
end
