class House < ActiveRecord::Base
  has_many :results, dependent: :restrict
end
