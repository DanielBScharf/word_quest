class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
  end

  private

  def question_params
    params.require(:question).permit(:time, :answer_id, :question_id, :character_id)
  end
end
