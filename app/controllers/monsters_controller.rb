class MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
  end
end
