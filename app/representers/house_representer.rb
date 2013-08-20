require 'roar/representer/json'

module HouseRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
end
