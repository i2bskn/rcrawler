# coding: utf-8

require "capybara"
require "capybara/dsl"
require "capybara-webkit"
require "nokogiri"
require "headless"

require "rcrawler/version"
require "rcrawler/driver"
require "rcrawler/crawl"

module RCrawler
  class << self
    def crawl(&block)
      c = Crawl.new
      c.instance_eval &block
    end
  end
end