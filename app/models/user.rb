class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :articles
  before_save {self.email = email.downcase }

  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
    uniqueness: { case_sensitivity: false}
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitivity: false},
    format: { with: VALID_EMAIL_REGEX }

  has_secure_password

end
