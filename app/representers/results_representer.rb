require 'representable/json/collection'

module ResultsRepresenter
  include Representable::JSON::Collection

  items extend: ResultRepresenter, class: Result
end
