class RemoveLanguageFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :language, :string
  end
end
