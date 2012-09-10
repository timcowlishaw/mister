require 'aruba/api'
require 'mister'
ENV['PATH'] = "#{File.join(File.dirname(__FILE__), "..", "bin")}:#{ENV['PATH']}"
RSpec.configure do |config|
  config.mock_framework = :mocha
  config.include(Aruba::Api)
end
