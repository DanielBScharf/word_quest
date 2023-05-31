class MonstersController < ApplicationController
  def show
    # need to fix this to show the information on a specific monster type
    @monster = Monster.find(params[:id])

    # creates a question so we can generate the question when the monster is called
    @character = Character.find_by(user_id: current_user.id)
  end

  respond_to do |format|
    format.html
    format.json { render json: { id: @monster.id } }
  end

  def update
    @monster = Monster.find(params[:id])
  end
end
