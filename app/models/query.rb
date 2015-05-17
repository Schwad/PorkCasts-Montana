class Query < ActiveRecord::Base
  belongs_to :user
  has_many :checks
  has_many :credit_cards
end
