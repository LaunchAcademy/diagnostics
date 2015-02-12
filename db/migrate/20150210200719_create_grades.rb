class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :correct_count, null: false
      t.integer :incorrect_count, null: false
      t.belongs_to :quiz, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
