class Schedule < ApplicationRecord
	validates_presence_of :scheduled_date
	validates :scheduled_date, uniqueness: { scope: :requester_id }
	belongs_to :caregiver, optional: true
	belongs_to :requester, optional:true
	has_many :events, dependent: :destroy

	has_many :comments, as: :commentable, dependent: :destroy

end
