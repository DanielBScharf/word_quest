class MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
  end

  def result
    @monster = Monster.find(params[:id])
    user_answer =
    actual_answer = Question.find_by(monster_id: params[:monster_id], id: params[:question_id])

    if user_answer == actual_answer
      @result = "win"
    else
      @result = "lose"
    end
  end
end
