class Question < ApplicationRecord
  belongs_to :monster
  has_many :answers

  validates :category, presence: true
end
