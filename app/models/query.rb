class Query < ActiveRecord::Base
  belongs_to :user
  has_many :checks, dependent: :destroy
  has_many :credit_cards, dependent: :destroy

  def payment_sum
    @total = 0
    self.checks.each do |check|
      if check.amount
        @total += check.amount
      end
    end
    self.credit_cards.each do |credit_card|
      if credit_card.amount
        @total += credit_card.amount
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

  def checks_by_day
    @array_of_data = []
    @array_of_moneys = []
    @array_of_dates = []
    self.checks.each do |check|
      @array_of_dates << check.payment_date&.to_date
      @array_of_moneys << check.amount
    end
    @array_of_data << @array_of_dates
    @array_of_data << @array_of_moneys
    return @array_of_data
  end

  def cards_by_day
    @array_of_data = []
    @array_of_moneys = []
    @array_of_dates = []
    self.credit_cards.each do |card|
      @array_of_dates << card.billing_date&.to_date
      @array_of_moneys << card.amount
    end
    @array_of_data << @array_of_dates
    @array_of_data << @array_of_moneys
    return @array_of_data
  end
end
