class Requester < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :events, dependent: :destroy

	has_many :comments, as: :commentable, dependent: :destroy

	has_many :schedules, dependent: :destroy
	has_many :scheduled_caregivers, through: :schedules, source: :caregiver, dependent: :destroy

	has_many :orders, dependent: :destroy
	has_many :ordered_caregivers, through: :orders, source: :caregiver, dependent: :destroy

	has_many :health_records, dependent: :destroy
	has_many :caregivers, through: :health_records, dependent: :destroy

	has_many :medications, dependent: :destroy
	
	has_many :health_records, dependent: :destroy

	def systolic
		arr = []
		self.health_records.each do |h|
			arr << h.systolic_record if h.systolic_record.present?
		end
		# arr.unshift("systolic")
		return arr
	end

	def diastolic
		arr = []
		self.health_records.each do |h|
			arr << h.diastolic_record if h.diastolic_record.present?
		end
		# arr.unshift("diastolic")
		return arr
	end

	def heart_rates
		arr = []
		self.health_records.each do |h|
			arr << h.heart_rate if h.heart_rate.present?
		end
		# arr.unshift("diastolic")
		return arr
	end

	def blood_sugars
		arr = []
		self.health_records.each do |h|
			arr << h.blood_sugar if h.blood_sugar.present?
		end
		# arr.unshift("diastolic")
		return arr
	end

	def rec_day
		arr = []
		self.health_records.each do |h|
			arr << h.record_day if h.blood_sugar.present?
		end
		return arr
	end

	def self.weekly_notify
		Requester.all.each do |c|
			UserMailer.notify_set_schedule(c.user).deliver_now!
		end		
	end
end
