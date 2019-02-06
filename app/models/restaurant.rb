require 'jwt'

class Restaurant < ApplicationRecord

  before_save :create_token
  # after_save :send_token

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, format: { with: /\d{1}-\d{3}-\d{3}-\d{3}/}
  validates :name, presence: true

  has_many :reservations
  has_many :shifts
  has_many :tables

  scope :by_reserv, ->(table_id, shift_id) { includes(:tables, :shifts).find_by(tables: {id:table_id}, shifts: {id: shift_id}) }

  private

  def create_token
    self.token = JWT.encode self, nil, false
  end

  def send_token
    RestaurantMailer.send_token(self.email, self.token).deliver_now
  end
end
