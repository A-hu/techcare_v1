class Event < ApplicationRecord
	validates_presence_of :schedule_id, :requester_id

	belongs_to :schedule
	belongs_to :requester

	has_many :time_eventships, dependent: :destroy
	has_many :time_zones, through: :time_eventships, dependent: :destroy

	has_many :event_demandships, dependent: :destroy
	has_many :demands, through: :event_demandships, dependent: :destroy

end
