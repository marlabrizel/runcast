class SegmentsController < ApplicationController
  before_action :authorize!
  respond_to :html, :js

  def show
    @pr = current_user.segment_personal_record(params["segment_name"])
    render layout: (request.xhr? ? false : true)
  end
end
