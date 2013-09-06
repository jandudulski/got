require 'roar/representer/json'

module NewGameRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::JSON::HAL::Links

  property :date
  property :game_version_id

  def date
    Date.today
  end

  link :create do
    games_path
  end
end
