class AddIpToAnswerSubmissions < ActiveRecord::Migration
  def change
    add_column :answer_submissions, :ip, :string, null: false
  end
end
