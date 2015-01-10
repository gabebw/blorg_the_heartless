require "webmock/rspec"

SPEC_ROOT = Pathname.new(__dir__)

Dir[SPEC_ROOT.join("support/non_rails/**/*.rb")].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  config.order = :random
end

WebMock.disable_net_connect!(allow_localhost: true)
