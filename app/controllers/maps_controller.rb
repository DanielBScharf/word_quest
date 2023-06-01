class MapsController < ApplicationController
  before_action :set_character, only: %i[index show_village show_castle]

  def index
    @map = Map.find_by_name("world")
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
  #  new comment here too Maybe this will let me push to heroku
  def show
    @map = Map.find(params[:id])
    @monsters = Monster.where(map: @map)
  end

  def show_village
    @monster = Monster.all.first
    @character.current_health = @character.max_health
    @character.update(current_health: @character.current_health)
    Monster.all.each do |monster|
      monster.update(current_health: monster.max_health)
    end
    CharacterAnswer.destroy_all
  end

  # def show_castle
  # #   redirect_to show_castle_character_maps_path(@character)
  # end

   # def show_castle
  # #   redirect_to show_castle_character_maps_path(@character)
  # end
  private

  def set_character
    @character = current_user.current_character
  end
end
