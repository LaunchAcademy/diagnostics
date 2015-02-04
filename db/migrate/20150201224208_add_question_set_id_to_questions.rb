class AddQuestionSetIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_set_id, :integer
  end
end
