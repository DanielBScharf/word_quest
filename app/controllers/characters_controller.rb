class CharactersController < ApplicationController

  def index
    @characters = Character.where(user: current_user)
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
    # @character.level = 1

    if @character.save
      redirect_to user_characters_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to character_path, status: :see_other
  end

  def update
    @character = Character.find(current_user.current_character_id)
  end
  private

  def character_params
    params.require(:character).permit(:name, :language, :level, :icon_name)
  end
end
