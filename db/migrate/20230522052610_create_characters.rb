class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :max_health
      t.integer :current_health
      t.integer :max_mana
      t.integer :current_mana

      t.timestamps
    end
  end
end
