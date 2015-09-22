class User < ActiveRecord::Base
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

  delegate :pr_activity_list, to: :strava_client
end
