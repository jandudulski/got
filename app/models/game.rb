class Game < ActiveRecord::Base
  has_many :results, dependent: :destroy
  belongs_to :game_version

  validates :date, presence: true
  validates :game_version_id, presence: true
end
