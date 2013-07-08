# coding: utf-8

require "spec_helper"

describe RCrawler::Driver do
  it "default_driver should be a webkit" do
    d = RCrawler::Driver.new
    expect(d.instance_eval {Capybara.default_driver}).to eq(:webkit)
  end

  it "should include Capybara::DSL" do
    d = RCrawler::Driver.new
    expect(d.respond_to? :visit).to be_true
  end

  describe "#initialize" do
    it "Headless object should be created if no argument" do
      mock = double("Headless mock")
      mock.should_receive(:start)
      Headless.should_receive(:new).and_return(mock)
      RCrawler::Driver.new
    end

    it "Headless should not start if headless is false" do
      Headless.any_instance.should_not_receive(:start)
      RCrawler::Driver.new(headless: false)
    end

    it "@headless should be specified object" do
      mock = double("Headless mock")
      mock.should_receive(:start)
      RCrawler::Driver.new(headless: mock)
    end
  end

  describe "#screenshot" do
    it "exception should be thrown if no argument" do
      expect{RCrawler::Driver.new.screenshot}.to raise_error(ArgumentError)
    end

    it "visit and save_screenshot method should be called" do
      d = RCrawler::Driver.new
      d.should_receive(:visit)
      d.should_receive(:page).and_return(double("page mock").as_null_object)
      d.screenshot("http://example.com", "/tmp/example.png")
    end
  end

  describe "#doc" do
    it "should return Nokogiri::HTML::Document object" do
      d = RCrawler::Driver.new
      d.page.should_receive(:html).and_return("<html></html>")
      expect(d.doc.is_a? Nokogiri::HTML::Document).to be_true
    end
  end
end
