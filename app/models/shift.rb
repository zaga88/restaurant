class Shift < ApplicationRecord
  validate :check_time!
  belongs_to :restaurant

  private

  def check_time!
    if self.start_time.to_formatted_s(:time) > self.end_time.to_formatted_s(:time)
      errors.add(:id, "Time of shift is invalid")
    end
  end
end
