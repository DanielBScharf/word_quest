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
    @character = Character.create
    @character.user = current_user

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
    params.require(:character).permit(:name)
  end

end
