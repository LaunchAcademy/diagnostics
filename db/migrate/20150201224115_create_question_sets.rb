class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_index :question_sets, :name, unique: true
  end
end
