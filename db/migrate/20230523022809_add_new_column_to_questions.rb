class AddNewColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :text, :string
  end
end
