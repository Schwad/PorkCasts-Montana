class UserMailer < ApplicationMailer
  default :from => "nicholas.schwaderer@gmail.com"
  default :bcc => "nicholas.schwaderer@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PorkCasts Montana!')
  end

  def query_match(query)
    @query = query
    @user = @query.user
    mail(to: query.user.email, subject: 'Check written to #{query.content}')
  end

  def test_mailer(user)
    @user = user
    mail(to: user.email, subject: 'This is a test rake task in heroku scheduler to ' + @user.email)
  end

  def query_match(user, payee, amount)
    @user = user
    @payee = payee
    @amount = amount
    mail(to: @user.email, subject: 'PORKCAST: New Payment to ' +  @payee + ' from the State of Montana in the amount of $' + @amount.to_s)
  end

  def fraud_mailer(query, check, card)
    @query = query
    @check = check
    @card = card
    mail(to: "nicholas.schwaderer@gmail.com", subject: "Possible Fraud: #{@query.content} is down.")
  end
end
