# coding: utf-8

module RCrawler
  class Driver
    Capybara.default_driver = :webkit
    include Capybara::DSL

    def doc
      Nokogiri::HTML(page.html)
    end
  end
end
