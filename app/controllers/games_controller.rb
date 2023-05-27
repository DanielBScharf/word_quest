class GamesController < ApplicationController
  # gets current user
  # gets monsters
  # sets map state
  # saves map state
  # monitors the player's state
  before_action :set_character, only: :index

  def new
    @user = current_user
    @character = current_user.character_id
    @monster = Monster.all.sample
    @battle = Battle.new
  end

  def edit
  end

  def index
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
