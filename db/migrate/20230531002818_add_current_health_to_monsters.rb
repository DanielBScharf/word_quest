class AddCurrentHealthToMonsters < ActiveRecord::Migration[7.0]
  def change
    add_column :monsters, :current_health, :integer
  end
end
