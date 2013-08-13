class Game < ActiveRecord::Base
  has_many :results
  belongs_to :game_version

  validates_presence_of :date
  validates_presence_of :game_version_id

  before_create :set_game_number!

  private

  def set_game_number!
    self.number = last_game_number + 1
  end

  def last_game_number
    Game.maximum(:number) || 0
  end
end
