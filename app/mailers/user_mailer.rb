class UserMailer < ApplicationMailer
	 default :from => "Techcare <techcare.tw@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  def notify_comment
    @greeting = "Hi"

    mail to: "zuzen324@hotmail.com"
  end
end
