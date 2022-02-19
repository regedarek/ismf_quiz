class AddSlugToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :slug, :string, null: false
    add_index :questions, :slug, unique: true
    add_column :questionnaires, :slug, :string, null: false
    add_index :questionnaires, :slug, unique: true
  end
end
