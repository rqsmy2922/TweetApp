class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = activate_user_url(@user.activation_token)
    mail(:to => user.email,
         :subject => "TweetAppへようこそ")
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_url(user)
    @user = user
    @url  = new_sessions_path
    mail(:to => user.email,
         :subject => "ユーザー認証に成功しました")
  end
  
  def reset_password_email(user)
    @user = User.find user.id
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(:to => user.email,
         :subject => "パスワードリセット用メール")
  end
end
