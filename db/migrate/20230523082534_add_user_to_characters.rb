class AddUserToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_reference :characters, :user, index: true
  end
end
