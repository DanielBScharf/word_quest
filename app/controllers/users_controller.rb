class UsersController < ApplicationController
  def edit
    current_user.current_character_id = params['format']
    if current_user.save
      redirect_to show_village_maps_path
    end
  end

  def update
    current_user.current_character_id = params[:id]
  end
end
