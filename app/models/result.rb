class Result < ActiveRecord::Base
  belongs_to :game
  belongs_to :house
  belongs_to :player

  validates :game_id, presence: true
  validates :house_id, presence: true, uniqueness: { scope: :game_id }
  validates :player_id, presence: true, uniqueness: { scope: :game_id }
  validates :position, presence: true, uniqueness: { scope: :game_id }
end
