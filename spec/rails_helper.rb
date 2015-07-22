# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require File.join(File.dirname(__FILE__), 'support/valid_attribute')
require File.join(File.dirname(__FILE__), 'support/factory_girl')
require 'capybara/rspec'
require "support/authentication_helper"
require 'factory_girl'
require 'factory_girl_rails'


ActiveRecord::Migration.maintain_test_schema!

OmniAuth.config.test_mode = true
include AuthenticationHelper

FactoryGirl.definition_file_paths = ['./spec/factories']
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
