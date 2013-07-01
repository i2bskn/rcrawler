# coding: utf-8

module RCrawler
  class Driver
    Capybara.default_driver = :webkit
    include Capybara::DSL
  end
end
