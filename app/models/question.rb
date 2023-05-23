class Question < ApplicationRecord
  belongs_to :monster
  has_many :answers
  has_many :character_answers

  validates :category, presence: true
  validates :text, presence: true
  validates :ai_question, presence: true
end
