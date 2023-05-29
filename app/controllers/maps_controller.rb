class MapsController < ApplicationController
  before_action :set_character, only: %i[index show_village]
  def index
    # @map = Map.all.first
    # @monster = Monster.all.first
    # @map = @monster.map

    respond_to do |format|
      format.html
      format.json { render json: { id: @monster.id } }
    end
  end

  def new
  end

  def show
  end

  def show_village
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
