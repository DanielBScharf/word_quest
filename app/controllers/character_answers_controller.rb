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
    character_answer = CharacterAnswer.new(text: @answer.text, answer_id: @answer.id, question_id: @question.id, character_id: @character.id)
    if character_answer.save
      p 'Success'
    else
      p 'Fails'
    end

    @health = @character.current_health
    unless @answer.correct
      @health -= 20
      @character.update(current_health: @health)
    end
    @show_health = @health

    if @health <= 0
      redirect_to show_village_character_maps_path(@character)
    end
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
