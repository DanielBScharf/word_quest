class AddCurrentCharacterReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :current_character_id, :integer
    add_reference :users, :current_character, foreign_key: { to_table: :characters }
  end
end
