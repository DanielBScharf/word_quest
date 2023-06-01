class CharacterAnswersController < ApplicationController
  before_action :set_character, only: %i[create show new result]
  before_action :set_question, only: %i[create show new result]
  before_action :set_answer, only: %i[create show new result]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def result
    character_answer = CharacterAnswer.new(text: @answer.text, answer: @answer, question: @question, character: @character)
    character_answer.save

    @monster = @question.monster

    if @answer.correct
      @monster.update(current_health: (@monster.current_health -= 1))
    else
      @character.update(current_health: (@character.current_health -= 20))
    end

    @show_health = @character.current_health / 10

    # redirect_to show_village_character_maps_path(@character) if @character.current_health <= 0

    answers = Answer.where(question_id: @question)
    @correct = answers.find_by(correct: true)
    @next_question = Question.where(monster: @monster).where.not(id: @character.questions).sample
  end

  private

  def character_answer_params
    params.require(:character_answer).permit(:answer_id, :question_id, :character_id)
  end

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end
end
