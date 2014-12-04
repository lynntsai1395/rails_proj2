class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :votes

  def has_voted_up(entity)
    vote = find_vote(entity)
    return (vote and vote.is_up)
  end

  def has_voted_down(entity)
    vote = find_vote(entity)
    return (vote and not vote.is_up)
  end

  # TODO: share this code with vote controller
  def find_vote(entity)
    entity_parts = entity.split('-')

    if entity_parts.length == 2
      id = entity_parts[1].to_i
      question = entity_parts[0] == 'question' ? id : nil
      answer = entity_parts[0] == 'answer' ? id : nil

      return Vote.where(:user_id => self.id, :question_id => question, :answer_id => answer).first
    end
  end
end
