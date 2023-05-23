class AddLanguageToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :language, :string
  end
end
