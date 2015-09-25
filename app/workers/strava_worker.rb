class StravaWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find_by(id: user_id)
    StravaSegmentSyncer.new(user).call
    user.done_processing!
  end
end
