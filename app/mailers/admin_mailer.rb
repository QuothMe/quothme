class AdminMailer < ActionMailer::Base
default from: 'no-reply.com'

  def email_user(user)
    @user = user

    mail(to: @user.email,
         subject: 'Account Created')
  end

end