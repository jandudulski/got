require 'representable/json/collection'

module PlayersRepresenter
  include Representable::JSON::Collection

  items extend: PlayerRepresenter, class: Player
end
