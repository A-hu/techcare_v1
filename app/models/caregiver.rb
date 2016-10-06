class Caregiver < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :schedules, dependent: :destroy


	has_many :comments, as: :commentable, dependent: :destroy

	has_many :orders, dependent: :destroy
	has_many :order_requesters, through: :orders, source: :requester, dependent: :destroy

	has_many :health_records, dependent: :destroy
	has_many :requesters, through: :health_records, dependent: :destroy
end
