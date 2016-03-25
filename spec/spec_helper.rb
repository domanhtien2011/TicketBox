require 'simplecov'
SimpleCov.start 'rails'

require_relative 'support/controller_helpers'
require 'devise'

RSpec.configure do |config|

  config.include ControllerHelpers, type: :controller
  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end
end


def select_date_and_time(date, options = {})
  field = options[:from]
  select date.strftime('%Y'), :from => "#{field}_1i" #year
  select date.strftime('%B'), :from => "#{field}_2i" #month
  select date.strftime('%d'), :from => "#{field}_3i" #day
  select date.strftime('%H'), :from => "#{field}_4i" #hour
  select date.strftime('%M'), :from => "#{field}_5i" #minute
end
