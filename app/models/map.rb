class Map < ApplicationRecord
  belongs_to :character

  validates :level, presence: true
  validates :completed, presence: true
end
