require "rails_helper"

RSpec.describe "User Can Pick A Segment from Form", type: :feature, sidekiq_inline: true, vcr: true do
  context "as an authenticated user" do
    before do
      visit root_path
      page.find(".login-button").click
    end

    it "can pick a segment from the segment picker form" do
      visit dashboard_path
      expect(page).to have_content "Choose a segment to get started!"

      select "Simba", from: "segment_name"
      click_on "Go!"

      expect(page).to have_content "Simba"
      expect(page).to have_content "Vail, Colorado"
    end
  end
end
