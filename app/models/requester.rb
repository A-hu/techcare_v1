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

	def systolic
		arr = []
		self.health_records.each do |h|
			arr << h.systolic_record
		end
		# arr.unshift("systolic")
		return arr
	end

	def diastolic
		arr = []
		self.health_records.each do |h|
			arr << h.diastolic_record
		end
		# arr.unshift("diastolic")
		return arr
	end

	def heart_rates
		arr = []
		self.health_records.each do |h|
			arr << h.heart_rate
		end
		# arr.unshift("diastolic")
		return arr
	end

	def rec_day
		arr = []
		self.health_records.each do |h|
			arr << h.record_day
		end
		return arr
	end
end
