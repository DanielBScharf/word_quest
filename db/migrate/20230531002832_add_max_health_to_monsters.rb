class AddMaxHealthToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :max_health, :integer
  end
end
