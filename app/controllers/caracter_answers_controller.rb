class CaracterAnswersController < ApplicationController
  def index
    @character_answers = CharacterAnswer.where(character_id == current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end
end
