class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
    
  default :from => "Techcare <techcare.tw@gmail.com>"

  def notify_comment(user, comment)
      @user = user
      @comment = comment
      mail(:to => user.email, :subject => "New Comment")
  end

  def notify_push(user, event)
      @user = user
      @event = event
      @demands = event.demands.map { |d| d.demand_name }
      @demand_ids = event.demands.map { |d| d.id }
      mail(:to => user.email, :subject => "#{@demands}已完成")
  end

  def notify_set_schedule(user)
    @user = user
    if @user.caregiver
      mail(:to => user.email, :subject => "Setting Schedule")
    else
      mail(:to => user.email, :subject => "Confirm Schedule")
    end
  end

end
