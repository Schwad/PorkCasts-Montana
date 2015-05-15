class UserMailer < ApplicationMailer
  default :from => "nicholas.schwaderer@gmail.com"
  default :bcc => "nicholas.schwaderer@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PorkCasts Montana!')
  end

  def query_match(user)
    mail(to: @user.email, subject: 'Check written to #{user.query}')
  end
end
