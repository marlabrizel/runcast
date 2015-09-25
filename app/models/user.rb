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

  def segment_names
    segments.pluck(:name).uniq
  end

  def segment_personal_record(name)
    segments.where(name: name).order('elapsed_time asc').first
  end

  def processing!
    Redis.current.set("user:#{id}:processing", "true")
  end

  def done_processing!
    Redis.current.del("user:#{id}:processing")
  end

  def processing?
    Redis.current.get("user:#{id}:processing") == "true"
  end

  delegate :segment_efforts, to: :strava_client

  delegate :weather, to: :forecast_io_client
end
