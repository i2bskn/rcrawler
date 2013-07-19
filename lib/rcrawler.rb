# coding: utf-8

require "capybara"
require "capybara/dsl"
require "capybara-webkit"
require "nokogiri"
require "headless"
require "timeout"

require "rcrawler/version"
require "rcrawler/configuration"
require "rcrawler/driver"
require "rcrawler/crawl"
require "rcrawler/async"

module RCrawler
  @config = Configuration.instance

  class << self
    def crawl(&block)
      begin
        Timeout::timeout(@config.timeout) {Crawl.new.instance_eval &block}
      rescue Timeout::Error => e
        raise if @config.timeout_proc == :raise
      end
    end

    def configure(&block)
      if block_given?
        @config.configure &block
      else
        @config
      end
    end

    def async(&block)
      async_threads = Async.new
      async_threads.instance_eval &block
      async_threads.execute
    end
  end
end