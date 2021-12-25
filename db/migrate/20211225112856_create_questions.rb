class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.integer :source, null: false
      t.string :source_url
      t.boolean :required, null: false, default: false
      t.references :questionnaire, null: false, foreign_key: true

      t.timestamps
    end
  end
end
