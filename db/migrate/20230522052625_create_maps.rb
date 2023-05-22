class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :level
      t.boolean :completed
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
