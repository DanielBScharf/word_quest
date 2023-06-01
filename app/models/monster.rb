class Monster < ApplicationRecord
  belongs_to :map
  has_many :questions
end
