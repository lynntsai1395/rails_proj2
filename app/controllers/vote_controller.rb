class VoteController < ApplicationController
  def cast
    entity = params[:entity]
    type = params[:type]

    entity_parts = entity.split('-')

    if entity_parts.length == 2
      id = entity_parts[1].to_i # i hate ruby so much
      question = entity_parts[0] == 'question' ? id : nil
      answer = entity_parts[0] == 'answer' ? id : nil

      # delete any existing votes
      vote = Vote.where(:user_id => current_user.id, :question_id => question, :answer_id => answer).first

      if vote
        vote.destroy
      end

      # otherwise, just deleting an existing vote
      if type == 'up' or type == 'down'
        vote = Vote.new

        vote.user = current_user
        vote.question_id = question
        vote.answer_id = answer
        vote.is_up = type == 'up'
        vote.save!
      end
    end

    render :nothing => true
  end
end
