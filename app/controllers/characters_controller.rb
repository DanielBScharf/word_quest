class CharactersController < ApplicationController

  def index
    @character = Character.where(character.user_id = current_user.id)
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    @character.max_mana = 100
    @character.max_health = 100
    if @character.save
      redirect_to show_village_maps_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to character_path, status: :see_other
  end

  private

  def character_params
    params.require(:character).permit(:name, :language, :level, :icon_name)
  end

end
