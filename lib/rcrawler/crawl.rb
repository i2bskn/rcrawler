# coding: utf-8

module RCrawler
  class Crawl < BasicObject
    def initialize
      @driver = Driver.new
    end

    def method_missing(action, *args)
      if @driver.respond_to? action
        @driver.send(action, *args)
      else
        super
      end
    end
  end
end
