class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  validates :name, :email, :password, presence: true
  validates :name, length: { maximum: Settings.length.digit_50 }
  validates :email, length: { maximum: Settings.length.digit_255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, length: { minimum: Settings.length.digit_6 }

  before_save :downcase_email

  private
  def downcase_email
    email.downcase!
  end
end
