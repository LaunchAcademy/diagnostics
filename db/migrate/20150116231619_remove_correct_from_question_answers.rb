class RemoveCorrectFromQuestionAnswers < ActiveRecord::Migration
  def change
    remove_column :question_answers, :correct, :boolean, default: false, null: false
  end
end
