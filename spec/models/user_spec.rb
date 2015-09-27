require 'rails_helper'

RSpec.describe User, type: :model do
  context "retrieving a user's segments" do
    let(:user) { User.create!(uid: 1, firstname: "Bob") }
    let!(:segment1) { Segment.create!(name: "Vail Pass", elapsed_time: 35, user_id: user.id) }
    let!(:segment2) { Segment.create!(name: "Vail Pass", elapsed_time: 74, user_id: user.id) }
    let!(:segment3) { Segment.create!(name: "Grand Traverse", elapsed_time: 20, user_id: user.id) }

    it "returns a list of unique segment names" do
      expect(user.segment_names.class).to eq Array
      expect(user.segment_names.size).to eq 2
      expect(user.segment_names.sort).to eq ["Grand Traverse", "Vail Pass"]
    end

    it "finds a user's best time by segment name" do
      pr = user.segment_personal_record("Vail Pass")

      expect(pr.elapsed_time).to eq 35
    end
  end
end
