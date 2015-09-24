require 'rails_helper'

RSpec.describe User, type: :model do
  context "retrieving a user's segments" do
    let(:user) { User.create!(uid: 1, firstname: "Bob") }
    let(:segment1) { Segment.create!(name: "Vail Pass", elapsed_time: 35, user_id: user.id) }
    let(:segment2) { Segment.create!(name: "Vail Pass", elapsed_time: 74, user_id: user.id) }
    let(:segment3) { Segment.create!(name: "Grand Traverse", elapsed_time: 20, user_id: user.id) }

    it "returns a list of unique segment names" do
      binding.pry
      expect(user.segment_names).to eq "halp"
    end
  end
end
