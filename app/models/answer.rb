class Answer < ApplicationRecord
  belongs_to :question
  has_many :character_answers

  validates :text, presence: true
end
