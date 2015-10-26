class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_email
  has_many :queries, dependent: :destroy
  accepts_nested_attributes_for :queries

  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end

  def send_test_email
    UserMailer.test_mailer(self).deliver!
  end

  def active_queries

  end

  def queries_daily_overload

    if self.queries.where("created_at = ?", today).count > 50
      return true
    else
      return false
    end

  end
end
