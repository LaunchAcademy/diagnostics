class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :question_id, null: false
      t.integer :answer_id, null: false
      t.boolean :correct, null: false, default: false

      t.timestamps null: false
    end
  end
end
