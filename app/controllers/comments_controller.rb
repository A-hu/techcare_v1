class CommentsController < ApplicationController
	before_action :authenticate_user!
	@@target_date = Date.new(2016,11,25)

	def new
		@comment = Comment.new
		@schedules = Schedule.where(["scheduled_date >=?", @@target_date.to_date-2.days]).where(["scheduled_date <?",@@target_date + 2.days])
		@schedule_dates = @schedules.pluck(:scheduled_date).uniq
	end

	def create
		if current_user.caregiver
			@schedule = current_user.caregiver.schedules.where(:requester_id => params[:related_id]).find_by_scheduled_date(params[:schedule])
		else
			@schedule = current_user.requester.schedules.where(:caregiver_id => params[:related_id]).find_by_scheduled_date(params[:schedule])
		end	
		@comment = @schedule.comments.new(comment_params)
		@comment.user_id = current_user.id

		if current_user.caregiver
			receiver = @schedule.requester
		else
			receiver = @schedule.caregiver
		end	
	
		if @comment.save
			UserMailer.notify_comment(receiver.user, @comment).deliver_now!
			flash[:notice]="發送成功"
			redirect_to schedule_path(current_user,:related_id=>receiver.id)
		else
			render :action => :new
		end		
	end

	private
	def comment_params
		 params.require(:comment).permit(:content,:comment_category_id)
	end

end
