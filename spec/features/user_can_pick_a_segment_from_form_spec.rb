require "rails_helper"

RSpec.describe "User Can Pick A Segment from Form", type: :feature, vcr: true do
  context "as an authenticated user" do
    before do
      visit root_path
      page.find(".login-button").click
    end

    it "can pick a segment from the segment picker form" do
      select "Simba", from: "Select a Segment:"
      click_on "Go!"

      expect(page).to have_content "Simba"
      expect(page).to have_content "Vail, Colorado"
    end
  end
end
