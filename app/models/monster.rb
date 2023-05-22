class Monster < ApplicationRecord
  belongs_to :map

  validates :name, presences: true, uniqueness: true
  validates :category, presences: true
end
