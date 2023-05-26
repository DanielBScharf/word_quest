class MapsController < ApplicationController
  def index
    @map = Map.find(params[:map_id])
    @monster = Monster.find(params[:id])
    @map = @monster.map

    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
  end
  def new
    num_monster = rand(3..5)
    @monster_arr = []

    num_monster.times do
      @monster_arr << Monster.show
    end
    # randomly select the monsters to show on the page, use JS to place them on the screen.
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
    @monster_arr
  end

  def show_village

  end
end
