# coding: utf-8

require "spec_helper"

describe RCrawler::Crawl do
  describe "#initialize" do
    it "Driver should be created" do
      mock = double("driver mock")
      RCrawler::Driver.should_receive(:new).and_return(mock)
      c = RCrawler::Crawl.new
      expect(c.instance_eval {@driver}).to eq(mock)
    end
  end

  describe "#method_missing" do
    it "method in Driver should be called" do
      RCrawler::Driver.any_instance.should_receive(:visit).and_return(true)
      expect {
        c = RCrawler::Crawl.new
        c.instance_eval {visit "http://example.com"}
      }.not_to raise_error
    end

    it "exception should be thrown if method is not defined in the Driver" do
      expect {
        c = RCrawler::Crawl.new
        c.instance_eval {unknown_method "arg"}
      }.to raise_error
    end
  end
end
