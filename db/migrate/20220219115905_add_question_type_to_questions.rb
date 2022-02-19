class AddQuestionTypeToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :question_type, :integer, null: false, default: 0
    add_column :questions, :position, :integer
  end
end
