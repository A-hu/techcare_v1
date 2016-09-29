class Event < ApplicationRecord
	validates_presence_of :schedule_id, :requester_id

	belongs_to :schedule
	belongs_to :requester
end
