require 'webmock'
require 'vcr'
require 'simplecov'
SimpleCov.start 'rails'
require 'coveralls'
Coveralls.wear!

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<STRAVA_CLIENT_ID>') { ENV['STRAVA_CLIENT_ID'] }
  config.filter_sensitive_data('<STRAVA_CLIENT_SECRET>') { ENV['STRAVA_CLIENT_SECRET'] }
  config.filter_sensitive_data('<STRAVA_TOKEN>') { ENV['STRAVA_TOKEN'] }
  config.filter_sensitive_data('<FORECAST_KEY>') { ENV['FORECAST_KEY'] }
end

RSpec.configure do |config|
  require "capybara/rspec"

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed
end
