class UserSleep < ApplicationRecord
  belongs_to :user
  validates :sleep_in, presence: true
  validate :wake_up_is_after_sleep_in

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

  private

  def wake_up_is_after_sleep_in
    if wake_up.presence && wake_up < sleep_in
      errors.add(:wake_up, 'cannot be before the sleep in')
    end
  end
end
