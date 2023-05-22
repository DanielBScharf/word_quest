class CharacterAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :question
  belongs_to :character
end
