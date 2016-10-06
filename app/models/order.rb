class Order < ApplicationRecord
	belongs_to :caregiver
	belongs_to :requester
end
