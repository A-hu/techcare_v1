class CommentCategory < ApplicationRecord
	has_many :comments, dependent: :destroy
end
