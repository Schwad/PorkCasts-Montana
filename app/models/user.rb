class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_email
  has_many :queries
  accepts_nested_attributes_for :queries

  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end

  def send_test_email
    Usermailer.test_mailer(self).deliver!
  end
end
