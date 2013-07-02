# coding: utf-8

require "spec_helper"

describe RCrawler do
  describe ".crawl" do
    it "method should be defined" do
      expect(RCrawler.respond_to? :crawl).to be_true
    end

    it "exception should be thrown if no argument" do
      expect{RCrawler.crawl}.to raise_error(ArgumentError)
    end

    it "Crawl object should be created" do
      mock = double("Crawl mock")
      RCrawler::Crawl.should_receive(:new).and_return(mock)
      mock.should_receive(:instance_eval)
      RCrawler.crawl {}
    end
  end
end
