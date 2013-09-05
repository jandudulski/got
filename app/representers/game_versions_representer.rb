require 'representable/json/collection'

module GameVersionsRepresenter
  include Representable::JSON::Collection

  items extend: GameVersionRepresenter, class: GameVersion
end
