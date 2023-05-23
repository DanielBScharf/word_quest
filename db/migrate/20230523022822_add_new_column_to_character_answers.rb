class AddNewColumnToCharacterAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :character_answers, :text, :string
  end
end
