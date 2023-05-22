class Character < ApplicationRecord
  has_many :maps
  has_many :character_answers

  validates :name, presence: true
  validates :max_health, presence: true
  validates :max_mana, presence: true
end
