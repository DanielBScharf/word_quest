class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    # @character = Character.find_by(user_id: current_user.id)
    # @monster = Monster.find(params[:monster_id])
    # # @question.level = @character.level
    # @question.ai_question = OpenaiService.new("give me an English CEFR A1 #{@monster.category} question with four choices and answers as an array").call
    # @question = @question.ai_question.match(/Question:\n(.+)(?=\na\))/)&.captures&.first
    @question.save
  end

  def show
    @question = Question.find(params[:id])
    @character_answer = CharacterAnswer.new
    @current_character = Character.find(current_user.current_character_id)
    @answers = Answer.where(question_id: @question.id)
    @correct = @answers.find {|answer| answer.correct == true }
  end
end
