require 'roar/representer/json'

module PlayerRepresenter
  include Roar::Representer::JSON

  property :id
  property :name
end
