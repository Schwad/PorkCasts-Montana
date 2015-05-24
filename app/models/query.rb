class Query < ActiveRecord::Base
  belongs_to :user
  has_many :checks
  has_many :credit_cards

  def payment_sum
    @total = 0
    self.checks.each do |check|
      if check.amount
        @total += check.amount
      end
    end
    self.credit_cards.each do |credit_card|
      if credit_card.amount
        @total += check.amount
      end
    end
    return @total
  end

  def largest_payment
    @largest = 0
    self.checks.each do |check|
      if check.amount > @largest
        @largest = check.amount
      end
    end
    self.credit_cards.each do |credit_card|
      if credit_card.amount > @largest
        @largest = credit_card.amount
      end
    end
    return @largest
  end
end
