require 'roar/representer/json'

module GameVersionRepresenter
  include Roar::Representer::JSON

  property :id
  property :name_with_capacity
end
