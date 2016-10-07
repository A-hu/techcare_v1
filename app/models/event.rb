class Event < ApplicationRecord
	validates_presence_of :schedule_id, :requester_id

	belongs_to :schedule
	belongs_to :requester
	belongs_to :time_zone

	has_many :event_demandships, dependent: :destroy
	has_many :demands, through: :event_demandships, dependent: :destroy

end
