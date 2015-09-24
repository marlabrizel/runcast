require "rails_helper"

RSpec.describe "User can log in with Strava OAuth", type: :feature, vcr: true do
  context "as a non-authenticated user" do
    it "can log in with strava oauth" do
      visit root_path
      page.find(".login-button").click

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content "Log Out"
      expect(page).to have_content "Choose a segment to get started!"
    end

    it "must be logged into access the dashboard" do
      visit dashboard_path

      expect(current_path).to eq(root_path)
    end
  end

  context "as an authenticated user" do
    before do
      log_in
    end

    it "can log out" do
      click_link "Log Out"

      expect(current_path).to eq(root_path)
      expect(page).not_to have_content "Log Out"
    end
  end
end
