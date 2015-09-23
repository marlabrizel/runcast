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
    @service ||= StravaService.new(token)
  end

  def sync_segments_from_strava
    segment_efforts.each do |effort|
      segment = Segment.find_or_create_by(strava_id: effort["segment"]["id"])
      segment.name = effort["name"]
      segment.date = effort["start_date_local"]
      segment.elapsed_time = effort["elapsed_time"]
      segment.distance = effort["distance"]
      segment.start_lat = effort["segment"]["start_latitude"]
      segment.start_long = effort["segment"]["start_longitude"]
      segment.user_id = self.id
      segment.save!

      segment
    end
  end

  def segment_names
    segments.pluck(:name).uniq
  end

  def segment_personal_record(name)
    segments.where(name: name).order('elapsed_time asc').first
  end

  delegate :segment_efforts, to: :strava_client
end
