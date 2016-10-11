class Event < ApplicationRecord
	validates_presence_of :schedule_id

	belongs_to :schedule
	belongs_to :time_zone, optional: true

	has_many :event_demandships, dependent: :destroy
	has_many :demands, through: :event_demandships, dependent: :destroy

end
