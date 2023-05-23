class AddNewColumnToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :text, :string
  end
end
