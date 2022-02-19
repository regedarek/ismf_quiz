class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.string :name, null: false
      t.boolean :correct, null: false, default: false
      t.belongs_to :question, null: false, type: :uuid

      t.timestamps
    end
  end
end
