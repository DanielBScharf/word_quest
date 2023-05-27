class GameController < ApplicationController
  
  def initialize
    @user = current_user
    @character = Character.find(@character)
    @map = Map.new
  end
end
