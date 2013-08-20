require 'representable/json/collection'

module GamesRepresenter
  include Representable::JSON::Collection

  items extend: GameRepresenter, class: Game
end
