class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true, dependent: :destroy
	belongs_to :comment_category
end
