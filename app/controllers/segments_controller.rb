class SegmentsController < ApplicationController
  before_action :authorize!

  def show
    @pr = current_user.segment_personal_record(params["segment_name"])
  end

  def find
    redirect_to dashboard_path({ segment_name: params["segments"] })
  end
end
