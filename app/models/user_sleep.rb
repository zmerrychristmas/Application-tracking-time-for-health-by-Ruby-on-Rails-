class UserSleep < ApplicationRecord
  belongs_to :user
  validates :sleep_in, presence: true

  after_validation :set_duration, if: :will_save_change_to_wake_up?
  scope :week, ->(user_id) {
    where("user_id = ? and date >= ?", user_id, 1.weeks.ago)
  }
  scope :month,  ->(user_id) {
    where("user_id = ? and date >= ?", user_id, 1.months.ago)
  }
  scope :year,  ->(user_id) {
    where("user_id = ? and date >= ?", user_id, 1.years.ago)
  }
  scope :in_time,  ->(user_id, start_time, end_time) {
    where("user_id = ? and sleep_in >= ? and sleep_in <= ?", user_id, start_time, end_time)
  }

  def set_duration
    self.duration = wake_up.to_i - sleep_in.to_i
  end
end
