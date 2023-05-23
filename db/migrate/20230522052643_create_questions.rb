class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :language
      t.string :category
      t.references :monster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
