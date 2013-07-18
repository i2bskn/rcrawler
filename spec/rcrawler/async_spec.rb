# coding: utf-8

require "spec_helper"

describe RCrawler::Async do
  let(:async) {RCrawler::Async.new}

  describe "#initialize" do
    it "Queue should be created" do
      mock = double("queue mock")
      Queue.should_receive(:new).and_return(mock)
      expect(async.instance_eval {@queue}).to eq(mock)
    end

    it "Configuration should be setted" do
      mock = double("configuration mock").as_null_object
      RCrawler::Configuration.should_receive(:instance).exactly(2).and_return(mock)
      expect(async.instance_eval {@config}).to eq(mock)
    end
  end

  describe "#crawl" do
    it "crawl task should be registered" do
      async
      expect {
        async.crawl {visit "http://example.com"}
      }.to change(async.instance_eval {@queue}, :size).by(1)
    end

    it "exception should be generated if not argument" do
      expect {async.crawl}.to raise_error(ArgumentError)
    end
  end

  describe "#execute" do
  end

  describe "#create_thread" do
    before {RCrawler::Crawl.stub(:new).and_return(double.as_null_object)}

    it "Thread object should be returned" do
      expect(async.send(:create_thread).is_a? Thread).to be_true
    end

    it "exec_crawl method should be called" do
      async.crawl {}
      expect{async.send(:create_thread)}.not_to raise_error
    end
  end

  describe "#exec_crawl" do
    it "Crawl object should be created" do
      mock = double("crawl mock")
      mock.should_receive(:instance_eval)
      RCrawler::Crawl.should_receive(:new).and_return(mock)
      expect(async.send(:exec_crawl, Proc.new{})).not_to raise_error
    end
  end
end
