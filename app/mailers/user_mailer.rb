class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "https://e47660a639d345139125b15ba93a9eb7.vfs.cloud9.us-east-2.amazonaws.com/users/#{user.activation_token}/activate"
    mail(:to => user.email,
         :subject => "TweetAppへようこそ")
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "https://e47660a639d345139125b15ba93a9eb7.vfs.cloud9.us-east-2.amazonaws.com/login"
    mail(:to => user.email,
         :subject => "ユーザー認証に成功しました")
  end
  
  def reset_password_email(user)
    @user = User.find user.id
    @url  = "https://e47660a639d345139125b15ba93a9eb7.vfs.cloud9.us-east-2.amazonaws.com/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email,
         :subject => "パスワードリセット用メール")
  end
end
