class Caregiver < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :schedules, dependent: :destroy

	has_many :caregiver_requester_relationships, dependent: :destroy
	has_many :requesters, through: :caregiver_requester_relationships, dependent: :destroy
end
