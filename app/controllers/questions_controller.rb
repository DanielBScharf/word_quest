class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @character = Character.find_by(user_id: current_user.id)
    @monster = Monster.find(params[:monster_id])
    # @question.level = @character.level Give me a CEFR A1 vocabulary question without the answer in the question. Include correct answer in JSON format.
    @question.ai_question = OpenaiService.new("Give me a CEFR A1 #{@monster.category} question without the answer in the question. Include correct answer in JSON format.").call
    @question = @question.ai_question.match(/Question:\n(.+)(?=\na\))/)&.captures&.first
    @question.save
  end

  def show
    @question = Question.find(params[:id])
  end
end
