class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @language = current_user.character.lanuage
    @type = Monster.find(params[:id]).category
    @level = current_user.character.level
    @ai_question = OpenaiService.new("give me a #{@level} #{@type} question with answer").call
    @question = Question.new
    @question.save
  end
end
