class GamesController < ApplicationController
  # gets current user
  # gets monsters
  # sets map state
  # saves map state
  # monitors the player's state
  before_action :set_character, only: %i[index new]
  # CHARACTER = Character.find(current_user.current_character_id)

  def new
    @user = current_user
    @character = Character.find(params[:id])
    @monster = Monster.all.sample
    @battle = Battle.new
  end

  def edit
  end

  def index
    @character = Character.find(params[:character_id])
    current_user.current_character_id = params[:character_id]
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
