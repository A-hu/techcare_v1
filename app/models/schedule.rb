class Schedule < ApplicationRecord
	validates_presence_of :caregiver_id, :scheduled_date
	belongs_to :caregiver
	has_many :events, dependent: :destroy

	has_many :comments, as: :commentable, dependent: :destroy
end
