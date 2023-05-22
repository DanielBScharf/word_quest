character-answers
class CharacterAnswersController < ApplicationController
  def index
    @character_answers = CharacterAnswer.where(character_id == current_user.id)
  end

  def show
    @character_answer = CharacterAnswer.find(params[:id])
  end

  def new
    @character_answer = CharacterAnswer.new
  end

  def create
    @character_answer = CharacterAnswer.new(character_answer_params)
  end

  private

  def character_answer_params
    params.require(:character_answer).permit(:time, :answer_id, :question_id, :character_id)
  end
end
