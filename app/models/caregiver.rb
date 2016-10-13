class Caregiver < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :schedules, dependent: :destroy


	has_many :comments, as: :commentable, dependent: :destroy

	has_many :schedules, dependent: :destroy
	has_many :scheduled_requesters, through: :schedules, source: :requester, dependent: :destroy


	has_many :orders, dependent: :destroy
	has_many :order_requesters, through: :orders, source: :requester, dependent: :destroy

	has_many :health_records, dependent: :destroy
	has_many :requesters, through: :health_records, dependent: :destroy

	def self.weekly_notify
		Caregiver.all.each do |c|
			UserMailer.notify_set_schedule(c.user).deliver_now!
		end		
	end

end
