class Segment < ActiveRecord::Base
  belongs_to :user

  def hours
    (elapsed_time / 3600.0).floor
  end

  def minutes
    raw = ((elapsed_time % 3600.0) / 60.0).floor
    raw.to_s.rjust(2, "0")
  end

  def seconds
    raw = (elapsed_time % 3600) % 60
    raw.to_s.rjust(2, "0")
  end
end
