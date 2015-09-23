require 'rails_helper'

RSpec.describe Segment, type: :model do
  context "finding duration for a segment" do
    let(:segment) { Segment.create!(elapsed_time: raw_time) }

    context "elapsed time in seconds only" do
      context "elapsed time under 10 seconds" do
        let(:raw_time) { 9 }

        it "can properly format elapsed time" do
          expect(segment.duration).to eq "0:00:09"
        end
      end

      context "elapsed time between 10 and 59 seconds" do
        let(:raw_time) { 29 }

        it "can properly format elapsed time" do
          expect(segment.duration).to eq "0:00:29"
        end
      end
    end

    context "elapsed time with minutes and seconds only" do
      context "elapsed time between 1 and 10 minutes" do
        let(:raw_time) { 347 }

        it "can properly format elapsed time" do
          expect(segment.duration).to eq "0:05:47"
        end
      end

      context "elapsed time between 10 and 59 minutes" do
        let(:raw_time) { 823 }

        it "can properly format elapsed time" do
          expect(segment.duration).to eq "0:13:43"
        end
      end
    end

    context "elapsed time with hours, minutes, and seconds" do
      context "elapsed time over 1 hour" do
        let(:raw_time) { 5823 }

        it "can properly format elapsed time" do
          expect(segment.duration).to eq "1:37:03"
        end
      end
    end
  end

  context "finding the time of day for a segment" do
    let(:segment) { Segment.create!(date: time) }

    context "in the early morning" do
      let(:time) { Time.utc(2002, 10, 31, 0, 0, 0) }

      it "can find time of day" do
        expect(segment.time_of_day).to eq "In The Early Morning"
      end
    end

    context "in the late morning" do
      let(:time) { Time.utc(2002, 10, 31, 10, 0, 0) }

      it "can find time of day" do
        expect(segment.time_of_day).to eq "In The Late Morning"
      end
    end

    context "in the early afternoon" do
      let(:time) { Time.utc(2002, 10, 31, 13, 0, 0) }

      it "can find time of day" do
        expect(segment.time_of_day).to eq "In The Early Afternoon"
      end
    end

    context "in the late afternoon" do
      let(:time) { Time.utc(2002, 10, 31, 15, 0, 0) }

      it "can find time of day" do
        expect(segment.time_of_day).to eq "In The Late Afternoon"
      end
    end

    context "in the evening" do
      let(:time) { Time.utc(2002, 10, 31, 18, 0, 0) }

      it "can find time of day" do
        expect(segment.time_of_day).to eq "In The Evening"
      end
    end

    context "at night" do
      let(:time) { Time.utc(2002, 10, 31, 22, 0, 0) }

      it "can find time of day" do
        expect(segment.time_of_day).to eq "At Night"
      end
    end
  end

  context "finding the season for a segment" do
    context "in the winter" do
      let(:december) { Segment.create!(date: december_date) }
      let(:december_date) { Time.new(2002, 12, 21) }
      let(:january) { Segment.create!(date: january_date) }
      let(:january_date) { Time.new(2002, 1, 20) }
      let(:february) { Segment.create!(date: february_date) }
      let(:february_date) { Time.new(2002, 2, 20) }
      let(:march) { Segment.create!(date: march_date) }
      let(:march_date) { Time.new(2002, 3, 20) }

      it "can can return the season" do
        expect(december.season).to eq "In the Winter"
        expect(january.season).to eq "In the Winter"
        expect(february.season).to eq "In the Winter"
        expect(march.season).to eq "In the Winter"
      end
    end

    context "in the spring" do
      let(:march) { Segment.create!(date: march_date) }
      let(:march_date) { Time.new(2002, 3, 21) }
      let(:april) { Segment.create!(date: april_date) }
      let(:april_date) { Time.new(2002, 4, 20) }
      let(:may) { Segment.create!(date: may_date) }
      let(:may_date) { Time.new(2002, 5, 20) }
      let(:june) { Segment.create!(date: june_date) }
      let(:june_date) { Time.new(2002, 6, 20) }

      it "can can return the season" do
        expect(march.season).to eq "In the Spring"
        expect(april.season).to eq "In the Spring"
        expect(may.season).to eq "In the Spring"
        expect(june.season).to eq "In the Spring"
      end
    end

    context "in the summer" do
      let(:june) { Segment.create!(date: june_date) }
      let(:june_date) { Time.new(2002, 6, 21) }
      let(:july) { Segment.create!(date: july_date) }
      let(:july_date) { Time.new(2002, 7, 21) }
      let(:august) { Segment.create!(date: august_date) }
      let(:august_date) { Time.new(2002, 8, 20) }
      let(:september) { Segment.create!(date: september_date) }
      let(:september_date) { Time.new(2002, 9, 20) }

      it "can can return the season" do
        expect(june.season).to eq "In the Summer"
        expect(july.season).to eq "In the Summer"
        expect(august.season).to eq "In the Summer"
        expect(september.season).to eq "In the Summer"
      end
    end

    context "in the fall" do
      let(:september) { Segment.create!(date: september_date) }
      let(:september_date) { Time.new(2002, 9, 21) }
      let(:october) { Segment.create!(date: october_date) }
      let(:october_date) { Time.new(2002, 10, 21) }
      let(:november) { Segment.create!(date: november_date) }
      let(:november_date) { Time.new(2002, 11, 21) }
      let(:december) { Segment.create!(date: december_date) }
      let(:december_date) { Time.new(2002, 12, 20) }

      it "can can return the season" do
        expect(september.season).to eq "In the Fall"
        expect(october.season).to eq "In the Fall"
        expect(november.season).to eq "In the Fall"
        expect(december.season).to eq "In the Fall"
      end
    end
  end
end
