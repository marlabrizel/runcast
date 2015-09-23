class Segment < ActiveRecord::Base
  belongs_to :user

  def duration
    "#{hours}:#{minutes}:#{seconds}"
  end

  def time_of_day
    if date.hour < 9
      "In The Early Morning"
    elsif date.hour < 12
      "In The Late Morning"
    elsif date.hour < 15
      "In The Early Afternoon"
    elsif date.hour < 17
      "In The Late Afternoon"
    elsif date.hour < 20
      "In The Evening"
    else
      "At Night"
    end
  end

  def season
    if date.month == 1 || date.month == 2
      "In the Winter"
    elsif date.month == 3
      if date.day < 21
        "In the Winter"
      else
        "In the Spring"
      end
    elsif date.month == 4 || date.month == 5
      "In the Spring"
    elsif date.month == 6
      if date.day < 21
        "In the Spring"
      else
        "In the Summer"
      end
    elsif date.month == 7 || date.month == 8
        "In the Summer"
    elsif date.month == 9
      if date.day < 21
        "In the Summer"
      else
        "In the Fall"
      end
    elsif date.month == 10 || date.month == 11
      "In the Fall"
    elsif date.month == 12
      if date.day < 21
        "In the Fall"
      else
        "In the Winter"
      end
    end
  end

  private

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
