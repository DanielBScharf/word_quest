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
    # p @character_answer = CharacterAnswer.new(character_answer_params)
    # @correct_answer = Answer.find(params[:answer_id])

    # @question = Question.find(params[:question_id])
    # @answer = Answer.find(params[:answer_id])
    # @character_answer = CharacterAnswer.new(character_answer_params)
    # @character_answer.character = @character
    # @character_answer.question = @question
    # @character_answer.answer = @answer
    # if @character_answer.save
    #   redirect_to character_question_answer_character_answer_path(@character, @question, @answer, @character_answer)
    # else
    #   render :show, status: :unprocessable_entity
    # end
    # @win = false
    # if @character_answer.text == @correct_answer.text
    #   @win = true
    # else
    #   @character.current_health = @character.max_health - 20
    # end
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
