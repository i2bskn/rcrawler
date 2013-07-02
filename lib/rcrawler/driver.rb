# coding: utf-8

module RCrawler
  class Driver
    Capybara.default_driver = :webkit
    include Capybara::DSL
    attr_accessor :headless

    def initialize(options={})
      @headless = options.fetch(:headless, Headless.new)
      @headless.start if @headless
    end

    def screenshot(url, file_path)
      visit(url)
      page.save_screenshot(file_path)
    end

    def doc
      Nokogiri::HTML(page.html)
    end
  end
end
