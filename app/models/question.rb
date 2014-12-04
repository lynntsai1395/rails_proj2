class Question < ActiveRecord::Base
  validates :user, presence: true
  validates :title, presence: true
  validates :content, presence: true

	belongs_to :user
	has_many :votes
  has_many :answers

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

    vote = user.find_vote("question-#{self.id}")

    if vote
      sum -= vote.is_up ? 1 : -1
    end

    return sum
  end
end
