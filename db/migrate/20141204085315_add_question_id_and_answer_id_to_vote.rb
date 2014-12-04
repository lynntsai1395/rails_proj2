class AddQuestionIdAndAnswerIdToVote < ActiveRecord::Migration
  def change
    add_column :votes, :question_id, :integer
    add_column :votes, :answer_id, :integer
  end
end
