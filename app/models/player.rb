class Player < ActiveRecord::Base
  has_many :results, dependent: :restrict
end
