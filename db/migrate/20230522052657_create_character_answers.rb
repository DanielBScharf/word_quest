class CreateCharacterAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :character_answers do |t|
      t.integer :time
      t.references :answer, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
