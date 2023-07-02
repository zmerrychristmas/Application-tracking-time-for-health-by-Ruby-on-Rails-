class UserSleepSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :sleep_in, :wake_up, :duration, :date
end
