class AddCurrentCharacterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :current_character_id, :integer
  end
end
