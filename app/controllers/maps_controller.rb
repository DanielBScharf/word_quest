class MapsController < ApplicationController
  def index
    @map = Map.all.first
    @monster = Monster.all.first
    @map = @monster.map

    # TODO: why is there javascript here?
    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
  end

  def new
    # TODO: refactor this or see how we use it
    num_monster = rand(3..5)
    @monster_arr = []
    # TODO: figure out why this doesn't work!
    num_monster.times do
      @monster_arr << Monster.show
    @map = Map.new
    end
    # randomly select the monsters to show on the page, use JS to place them on the screen.
  end

  def show
    @map = Map.find(params[:id])
    @monster_arr
  end

  def show_village
    # FIXME: What is this for
  end
end
