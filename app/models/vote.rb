class Vote < ActiveRecord::Base
  validates :user, presence: true
  validates_inclusion_of :is_up, in: [true, false]

	belongs_to :user
	has_one :question
end
