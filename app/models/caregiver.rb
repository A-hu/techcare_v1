class Caregiver < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :schedules, dependent: :destroy
end
