class User < ActiveRecord::Base
  has_many :queries
  accepts_nested_attributes_for :queries

  after_create :send_welcome_email
  private
  def send_welcome_email
    # Note that the bang (!) method will blow
    # up (roll back) the save transaction on failure
    UserMailer.welcome(self).deliver_now!
  end
end
