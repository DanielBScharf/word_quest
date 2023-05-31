class UsersController < ApplicationController
  def edit
    current_user.current_character_id = params['format']
    redirect_to show_village_maps_path if current_user.save
  end

  def update
    current_user.current_character_id = params[:id]
  end
end
