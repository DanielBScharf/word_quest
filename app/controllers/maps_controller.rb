class MapsController < ApplicationController
  before_action :set_character, only: %i[index show_village show_castle]
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
  end

  def show
  end

  def show_village
    @monster = Monster.all.first
    @character.current_health = @character.max_health
    @character.update(current_health: @character.current_health)
    Monster.all.each do |monster|
      monster.update(current_health: monster.max_health)

    end
  end

  # def show_castle
  # #   redirect_to show_castle_character_maps_path(@character)
  # end
  def show_cave
    @map = Map.all.first
    @monster = Monster.all.first
    @map = @monster.map
    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
    @health = set_character.current_health

  end

  def show_ruin
    @map = Map.all.first
    @monster = Monster.all.first
    @map = @monster.map
    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
    @health = set_character.current_health

  end
  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
