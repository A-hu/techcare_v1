class Requester < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :events, dependent: :destroy

	has_many :comments, as: :commentable, dependent: :destroy

	has_many :orders, dependent: :destroy
	has_many :ordered_caregivers, through: :orders, source: :caregiver, dependent: :destroy

	has_many :health_records, dependent: :destroy
	has_many :caregivers, through: :health_records, dependent: :destroy

	has_many :medications, dependent: :destroy
	
	has_many :health_records, dependent: :destroy
end
