class StravaService
  attr_reader :strava_connection

  def initialize(user)
    @strava_connection ||= Strava::Api::V3::Client.new(:access_token => user.token)
  end

  def segment_efforts
    detailed_activities_list.flat_map { |activity| activity["segment_efforts"] }
  end

  def detailed_activities_list
    activities_with_achievements.map { |activity| strava_connection.retrieve_an_activity(activity["id"]) }
  end

  def activities_with_achievements
    activities.select { |activity| activity["achievement_count"] > 0 }
  end

  def activities
    strava_connection.list_athlete_activities
  end
end
