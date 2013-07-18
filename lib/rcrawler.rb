# coding: utf-8

require "capybara"
require "capybara/dsl"
require "capybara-webkit"
require "nokogiri"
require "headless"

require "rcrawler/version"
require "rcrawler/driver"
require "rcrawler/crawl"
require "rcrawler/async"

module RCrawler
  class << self
    def crawl(&block)
      crwl = Crawl.new
      crwl.instance_eval &block
    end

    def async(&block)
      async_threads = Async.new
      async_threads.instance_eval &block
      async_threads.execute
    end
  end
end