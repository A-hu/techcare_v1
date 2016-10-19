class Medication < ApplicationRecord
	
	scope :new_medication, ->(last_time) { where( "updated_at = ?", last_time ) }

	belongs_to :requester
	belongs_to :medication_time, foreign_key: :time_id

	has_attached_file :picture, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
