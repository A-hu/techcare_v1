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

  def notify_push(user, event, care_date)
      @user = user
      @event = event
      @demands = event.demands.map { |d| d.demand_name }
      @demand_ids = event.demands.map { |d| d.id }
      if @demand_ids.include?(21)
        @health_record = HealthRecord.find_by( requester_id: user.requester.id, record_day: care_date, blood_sugar: nil )
      elsif @demand_ids.include?(22)
        @health_record = HealthRecord.find_by( requester_id: user.requester.id, record_day: care_date, systolic_record: nil, diastolic_record: nil, heart_rate: nil ) 
      end
      mail(:to => user.email, :subject => "#{@demands}已完成")
  end

  def notify_set(requester, care_date)
    @requester = requester
    @schedule = Schedule.find_by(requester_id: requester.id, scheduled_date: care_date)
    mail(:to => requester.user.email, :subject => "請確認排程")
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
