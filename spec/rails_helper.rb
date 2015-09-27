ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'sidekiq/testing'
Sidekiq::Testing.inline!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.before :each do
    OmniAuth.config.mock_auth[:strava] = nil
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:strava] = OmniAuth::AuthHash.new({
          :provider => 'strava',
          :uid => ENV['STRAVA_UID'],
          :info => {
            :email => "marla@example.com",
            :location => "Denver, CO",
            :description => "this is me",
          },
          :extra => {
            :raw_info => {
              :firstname => "Marla",
              :lastname => "Brizel",
              :profile_medium => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLuXPe1Vkd8Wi3umpz9DDHjLUYymSAIaFmDvzKGrpy4I8kGKgtwvF3odo",
              :athlete_type => "1"
            }
          },
          :credentials => {
            :token => ENV['STRAVA_TOKEN'],
          }
        })
  end

  def log_in
    visit root_path
    page.find(".login-button").click
  end
end
