class MonstersController < ApplicationController
  def show
    @monster = Monster.all.first
    @character = Character.find_by(user_id: current_user.id)
    @question = Question.new
    @question.monster = @monster
    @question.category = @monster.category
  end

  respond_to do |format|
    format.html
    format.json { render json: { id: @monster.id } }
  end

end
