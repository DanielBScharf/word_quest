class Answer < ApplicationRecord
  belongs_to :question
  has_many :character_answers

  validates :correct, presence: true
end
