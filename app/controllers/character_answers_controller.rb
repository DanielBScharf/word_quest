class CharacterAnswersController < ApplicationController
  def index
    @character_answers = CharacterAnswer.where(character_id == current_user.id)
  end

  def show
    @character = Character.find(current_user.current_character_id)
    @character_answer = CharacterAnswer.find(params[:id])
    @correct_answer = Answer.find(params[:answer_id])
    @question = Question.find(params[:question_id])
    @win = false

    if @character_answer == @correct_answer
      @win = true
    else
      @character.current_health = @character.max_health - 20
    end

  end

  def new
    @character_answer = CharacterAnswer.new
  end

  def create
    @character = Character.find(current_user.current_character_id)
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @character_answer = CharacterAnswer.new(character_answer_params)
    @character_answer.character = @character
    @character_answer.question = @question
    @character_answer.answer = @answer
    if @character_answer.save
      redirect_to character_question_answer_character_answer_path(@character, @question, @answer, @character_answer)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def character_answer_params
    params.require(:character_answer).permit(:text, :answer_id, :question_id, :character_id)
  end
end
