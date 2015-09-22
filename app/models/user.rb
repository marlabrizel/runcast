class User < ActiveRecord::Base
  has_many :segments

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid)

    user.provider = data.provider
    user.email = data.info.email
    user.firstname = data.extra.raw_info.firstname
    user.lastname = data.extra.raw_info.lastname
    user.avatar = data.extra.raw_info.profile_medium
    user.athlete_type = data.extra.raw_info.athlete_type
    user.location = data.info.location
    user.token = data.credentials.token
    user.save!

    user
  end

  def strava_client
    @service ||= StravaService.new(self)
  end

  def sync_segments_from_strava
    #these are really segments efforts but keeping naming to match model for now
    segment_efforts.each do |effort|
      segments.create!(
        name: effort["name"],
        date: effort["start_date_local"],
        elapsed_time: effort["elapsed_time"],
        distance: effort["distance"],
        start_lat: effort["segment"]["start_latitude"],
        start_long: effort["segment"]["start_longitude"],
        strava_id: effort["segment"]["id"]
      )
    end
  end

  def segment_names
    segments.pluck(:name).uniq
  end

  delegate :segment_efforts, to: :strava_client
end
