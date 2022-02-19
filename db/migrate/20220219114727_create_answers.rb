class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :name, null: false
      t.boolean :correct, null: false, default: false
      t.uuid :question_id, null: false

      t.timestamps
    end
  end
end
