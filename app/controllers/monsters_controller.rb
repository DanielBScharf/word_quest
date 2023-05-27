class MonstersController < ApplicationController
  def show
    @monster = Monster.select(params[:id])
    # TODO:everything below will be handled by the game controller
    # @character = Character.find_by(current_user: current_character_id)
    # @question.monster = @monster
    # @question.category = @monster.category
  end

  respond_to do |format|
    format.html
    format.json { render json: { id: @monster.id } }
  end

end
