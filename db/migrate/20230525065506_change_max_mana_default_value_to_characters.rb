class ChangeMaxManaDefaultValueToCharacters < ActiveRecord::Migration[7.0]
  def change
    change_column_default :characters, :max_mana, 100
  end
end
