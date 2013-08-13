class GameVersion < ActiveRecord::Base
  has_many :games

  def name_with_capacity
    "#{name} (#{min_players}-#{max_players})"
  end
end
