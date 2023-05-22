class MonstersController < ApplicationController

  def show
    @monster = Monster.find_by(params[:id])
  end
end
