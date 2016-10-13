class UserMailer < ApplicationMailer
	 default :from => "Techcare <techcare.tw@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject

  def notify_comment(user, comment)
      @user = user
      @comment = comment
      mail(:to => user.email, :subject => "New Comment")
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
