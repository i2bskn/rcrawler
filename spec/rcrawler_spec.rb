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

    it "exception should be generated if timeout" do
      Timeout.should_receive(:timeout).and_raise(Timeout::Error)
      expect{RCrawler.crawl {}}.to raise_error(Timeout::Error)
    end
  end

  describe ".async" do
    it "method should be defined" do
      expect(RCrawler.respond_to? :async).to be_true
    end

    it "exception should be thrown if no argument" do
      expect{RCrawler.async}.to raise_error(ArgumentError)
    end

    it "Async object should be created" do
      mock = double("Async mock")
      RCrawler::Async.should_receive(:new).and_return(mock)
      mock.should_receive(:instance_eval)
      mock.should_receive(:execute)
      RCrawler.async {}
    end
  end

  describe ".configure" do
    it "return configuration object" do
      expect(RCrawler.configure.is_a? RCrawler::Configuration).to be_true
    end

    it "set config value from block" do
      RCrawler.configure do |c|
        c.threads = 10
      end
      expect(RCrawler.configure.threads).not_to eq(8)
      expect(RCrawler.configure.threads).to eq(10)
    end
  end
end
