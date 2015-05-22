class UserMailer < ApplicationMailer
  default :from => "nicholas.schwaderer@gmail.com"
  default :bcc => "nicholas.schwaderer@gmail.com"

  def welcome(user)

    @user = user
    mail(to: @user.email, subject: 'Welcome to PorkCasts Montana!')
  end

  def query_match(query)
    mail(to: query.user.email, subject: 'Check written to #{query.content}')
  end

  def test_mailer(user)
    mail(to: user.email, subject: 'This is a test rake task in heroku scheduler!')
  end
end
