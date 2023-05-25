class ChangeMaxHealthDefaultValueToCharacters < ActiveRecord::Migration[7.0]
  def change
    change_column_default :characters, :max_health, 100
  end
end
