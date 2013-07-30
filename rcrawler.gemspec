# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rcrawler/version'

Gem::Specification.new do |spec|
  spec.name          = "rcrawler"
  spec.version       = RCrawler::VERSION
  spec.authors       = ["i2bskn"]
  spec.email         = ["i2bskn@gmail.com"]
  spec.description   = %q{The wrapper of capybara for crawler}
  spec.summary       = %q{The wrapper of capybara for crawler}
  spec.homepage      = "https://github.com/i2bskn/rcrawler"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "thor"
  spec.add_dependency "capybara"
  spec.add_dependency "capybara-webkit"
  spec.add_dependency "nokogiri"
  spec.add_dependency "headless"
end
