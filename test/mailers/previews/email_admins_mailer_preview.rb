# Preview all emails at http://localhost:3000/rails/mailers/email_admins_mailer
class EmailAdminsMailerPreview < ActionMailer::Preview
  default from: 'noreply@quoth.me'

  def email_admins(admin)
    @admin = admin
    mail(to: @admin.email, subject: "You've been added as an Admin")
  end

end
