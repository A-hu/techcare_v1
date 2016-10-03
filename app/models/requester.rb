class Requester < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :events, dependent: :destroy

	has_many :comments, as: :commentable

	has_many :caregiver_requester_relationships, dependent: :destroy
	has_many :caregivers, through: :caregiver_requester_relationships, dependent: :destroy

end
