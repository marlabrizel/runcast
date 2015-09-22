require "rails_helper"

RSpec.describe "User can log in with Strava OAuth", type: :feature, vcr: true do
  context "as a non-authenticated user" do
    it "can log in with strava oauth" do
      visit root_path
      page.find(".login-button").click

      expect(current_path).to eq(dashboard_path)
    end
  end
end
