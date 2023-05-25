class CharactersController < ApplicationController

  def index
    @character = Character.where(user_id: current_user)
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new
    @character.user = current_user
    @character.level = 1
    @character.max_mana = 100
    @character.max_health = 100
    if @character.save
      redirect_to character_path(@character)
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
    params.require(:character).permit(:name, :level, :language)
  end

end
