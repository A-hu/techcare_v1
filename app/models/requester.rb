class Requester < ApplicationRecord

	validates_presence_of :user_id

	belongs_to :user
	has_many :events, dependent: :destroy
end
