class MapsController < ApplicationController
  def index
    @character = Character.find(params[:character_id])
    @map = Map.all.first
    num_monster = rand(3..5)
    @monster_arr = []

    num_monster.times do
      @monster_arr << Monster.all.sample
    end

    # TODO: why is there javascript here?
    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
  end

  def new
    # TODO: refactor this or see how we use it
    # TODO: figure out why this doesn't work!
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
