require 'jwt'

class Restaurant < ApplicationRecord

  before_save :create_token

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, format: { with: /\d{1}-\d{3}-\d{3}-\d{3}/}
  validates :name, presence: true

  has_many :shifts
  has_many :tables

  private

  def create_token
    self.token = JWT.encode self, nil, false
  end
end
