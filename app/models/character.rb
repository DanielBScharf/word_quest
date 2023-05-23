class Character < ApplicationRecord
  has_many :maps
  has_many :character_answers
  belongs_to :user

  validates :name, presence: true
  validates :max_health, presence: true
  validates :max_mana, presence: true
  validates :language, presence: true
end
