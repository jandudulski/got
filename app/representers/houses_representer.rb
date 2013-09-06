require 'representable/json/collection'

module HousesRepresenter
  include Representable::JSON::Collection

  items extend: HouseRepresenter
end
