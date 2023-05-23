class AddAnotherColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :ai_question, :string
  end
end
