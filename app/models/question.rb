class Question < ApplicationRecord
  belongs_to :monster
  has_many :answers
  has_many :character_answers

  validates :type, presence: true
  validates :language, presence: true
end
