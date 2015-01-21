class CreateAnswerSubmissions < ActiveRecord::Migration
  def change
    create_table :answer_submissions do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :answer_id, null: false

      t.timestamps null: false
    end

    add_index :answer_submissions, [:user_id, :question_id], unique: true
  end
end
