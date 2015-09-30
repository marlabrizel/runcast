class StravaSegmentSyncer
  def initialize(user)
    @user = user
  end

  def strava_client
    @service ||= StravaService.new(@user.token)
  end

  delegate :segment_efforts,
           :detailed_activities_list, to: :strava_client

  def call
    detailed_activities_list.each do |activity|
      polyline = activity['map']['polyline']
      activity['segment_efforts'].each do |effort|
        segment = Segment.find_or_create_by(strava_id: effort["segment"]["id"])
        segment.name = effort["name"]
        segment.date = effort["start_date_local"]
        segment.elapsed_time = effort["elapsed_time"]
        segment.distance = effort["distance"]
        segment.city = effort["segment"]["city"]
        segment.state = effort["segment"]["state"]
        segment.start_lat = effort["segment"]["start_latitude"]
        segment.start_long = effort["segment"]["start_longitude"]
        segment.end_lat = effort["segment"]["end_latitude"]
        segment.end_long = effort["segment"]["end_longitude"]

        forecast = ForecastIO.forecast(segment.start_lat, segment.start_long, time: segment.date.to_i).currently

        segment.conditions = forecast.summary
        segment.temperature = forecast.temperature
        segment.humidity = forecast.humidity
        segment.wind_speed = forecast.windSpeed
        segment.user_id = @user.id
        segment.polyline = polyline
        segment.save!
      end
    end
  end
end
