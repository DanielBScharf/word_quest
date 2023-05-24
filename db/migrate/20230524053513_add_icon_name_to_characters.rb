class AddIconNameToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :icon_name, :string
  end
end
