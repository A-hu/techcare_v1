class CommentCategary < ApplicationRecord
	has_many :comments, dependent: :destroy
end
