class Map < ApplicationRecord
  belongs_to :character

  validates :completed, presence: true
end
