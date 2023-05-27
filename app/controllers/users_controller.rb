class UsersController < ApplicationController
  def edit
    current_user.current_character_id = params['format']
    if current_user.save
      redirect_to show_village_maps_path
    end
  end

  # TODO: "destroy" sets user to invisible but saves info for analytical purposes
end
