class MonstersController < ApplicationController
  def show
    @map = Map.find(params[:map_id])
    @monster = @map.monsters.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
  end
end
