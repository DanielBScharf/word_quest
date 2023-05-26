class MonstersController < ApplicationController
  def show
   @monster = Monster.find(params[:id])

    # creates a question so we can generate the question when the monster is called
    
  end

    private

    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
end
