ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

require 'bundler'

Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
