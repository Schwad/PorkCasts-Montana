class UserMailer < ApplicationMailer
  default :from => "nicholas.schwaderer@gmail.com"
  default :bcc => "nicholas.schwaderer@gmail.com"

  def admin_test(user)
    @user = user
    mail(to: @user.email, subject: "PorkCast compromised by State of Montana, partially back online")
  end

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PorkCasts Montana!')
  end

  # def query_match(query)
  #   @query = query
  #   @user = @query.user
  #   mail(to: query.user.email, subject: 'Check written to #{query.content}')
  # end

  def test_mailer(user)
    @user = user
    mail(to: user.email, subject: 'This is a test rake task in heroku scheduler to ' + @user.email)
  end

  def query_match(user, payments)
    @user = user
    @payments = payments
    sum = 0
    @payments.each {|a| sum+=a[1]}
    @sum = sprintf( "%0.02f", sum)
    mail(to: @user.email, subject: 'PORKCAST: New Montana Spending in the amount of $' + @sum + ' to your Porkcast queries!')
  end

  def fraud_mailer(query, check, card)
    @query = query
    @check = check
    @card = card
    mail(to: "nicholas.schwaderer@gmail.com", subject: "Possible Fraud: #{@query.content} is down.")
  end

  def porkcast_version_release(user)
    @user = user
    mail(to: @user.email, subject: 'PorkCasts prepares for updated release!')
  end


end
