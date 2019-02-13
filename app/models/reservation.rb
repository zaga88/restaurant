class Reservation < ApplicationRecord
  after_create :send_emails

  validate :reservation_uniqueness!, on: :create
  validate :check_table_guest!
  validate :check_shifts!

  belongs_to :user
  belongs_to :restaurant
  belongs_to :table
  belongs_to :shift

  private

  def reservation_uniqueness!
    if Reservation.where("table_id = ? AND shift_id = ? AND DATE(start_at) = ?", self.table_id, self.shift_id, self.start_at.to_date).present?
      errors.add(:id, "have existing reservation")
    end
  end

  def check_table_guest!
    unless table.min_guest <= self.guest_count && self.guest_count <= table.max_guest
      errors.add(:id, "table is too small for guest")
    end
  end

  def check_shifts!
    unless shift.start_time.to_formatted_s(:time) <= self.start_at.to_formatted_s(:time) &&
       self.start_at.to_formatted_s(:time) <= shift.end_time.to_formatted_s(:time) &&
       shift.start_time.to_formatted_s(:time) <= self.end_at.to_formatted_s(:time) &&
       self.end_at.to_formatted_s(:time) <= shift.end_time.to_formatted_s(:time)
          errors.add(:id, "Time of reservation is invalid")
    end
  end

  def send_emails
    RestaurantMailer.send_user_reserv(self).deliver_now
    RestaurantMailer.send_restaurant_reserv(self).deliver_now
  end
end
