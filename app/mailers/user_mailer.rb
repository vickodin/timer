class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  #default_url_options[:host] = request.host_with_port
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    mail(:to => user.email, :subject => "password reset")
  end
end
