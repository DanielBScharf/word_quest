class MonstersController < ApplicationController
  def show
  # need to fix this to show the information on a specific monster type
  @monster = Monster.all.sample
  # creates a question so we can generate the question when the monster is called

  # creates a question so we can generate the question when the monster is called
  @character = Character.find_by(user_id: current_user.id)
  @question = Question.new
  @question.monster = @monster
  # response = openapi.split(',', 3)
  # @question.text = response[0].tr('"', '')
  # @choices = response[2].tr('/([|]|")/', '').split(',')
  # @answer = response[1].tr('"', '')

  @question.category = @monster.category
  end
  respond_to do |format|
    format.html
    format.json { render json: { id: @monster.id } }
  end

end
