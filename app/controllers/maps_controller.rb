class MapsController < ApplicationController
  before_action :set_character, only: %i[index show_village]
  def index
    @map = Map.all.first
    @monster = Monster.all.first
    @map = @monster.map
    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
    @health = set_character.current_health
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
    @character.current_health = @character.max_health
    @character.update(current_health: @character.current_health)
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
