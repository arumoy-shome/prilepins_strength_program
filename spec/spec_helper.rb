require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'shoulda/matchers'
require 'rspec-given'

#include everything in support
Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
