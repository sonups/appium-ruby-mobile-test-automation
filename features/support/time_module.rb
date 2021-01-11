# frozen_string_literal: true

def time_now
  time1 = Time.new
  time1.day.to_s + time1.hour.to_s + time1.min.to_s
end
