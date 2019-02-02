class User < ApplicationRecord
  has_secure_password

  validates_length_of       :password, maximum: 20, minimum: 6, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of     :email
  validates_uniqueness_of   :email
  validates :name, presence: true, length: { maximum: 30 }
end
