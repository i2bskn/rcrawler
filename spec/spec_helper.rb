require "simplecov"
require "coveralls"
Coveralls.wear!

# SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start do
  add_filter "spec"
  add_filter ".bundle"
end

require "rcrawler"

RSpec.configure do |config|
  config.order = "random"
end