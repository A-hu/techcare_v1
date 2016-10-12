class CommentsController < ApplicationController
	def new
		@comment = Comment.new
		@schedules = Schedule.where(["scheduled_date>?", Time.now]).where(["scheduled_date<?",Time.now + 7.days])
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
	end

	def create
		@schedule = Schedule.find_by_scheduled_date(params[:schedule])
		@comment = @schedule.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to schedule_path(current_user)
	end

	private
	def comment_params
		 params.require(:comment).permit(:content,:comment_category_id)
	end

end
