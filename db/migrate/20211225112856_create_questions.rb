class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :name, null: false
      t.integer :source, null: false
      t.string :source_url
      t.boolean :required, null: false, default: false
      t.belongs_to :questionnaire, null: false, type: :uuid

      t.timestamps
    end
  end
end
