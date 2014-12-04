class Answer < ActiveRecord::Base
  validates :user, presence: true
  validates :question, presence: true
  validates :content, presence: true

	belongs_to :user
	belongs_to :question
	has_many :votes

  def num_votes
    sum = 0

    votes.each do |vote|
      sum += vote.is_up ? 1 : -1
    end

    return sum
  end

  def num_votes_without(user)
    sum = self.num_votes

    if not user
      return sum
    end

    vote = user.find_vote("answer-#{self.id}")

    if vote
      sum -= vote.is_up ? 1 : -1
    end

    return sum
  end
end
