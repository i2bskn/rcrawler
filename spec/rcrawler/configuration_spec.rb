# coding: utf-8

require "spec_helper"

describe RCrawler::Configuration do
  let(:config) {RCrawler::Configuration.instance}

  describe "defined accessors" do
    it "defined threads" do
      expect(config.respond_to? :threads).to be_true
    end

    it "defined timeout" do
      expect(config.respond_to? :timeout).to be_true
    end

    it "defined timeout_proc" do
      expect(config.respond_to? :timeout_proc).to be_true
    end
  end

  describe "#initialize" do
    it "threads should be a default" do
      expect(config.threads).to eq(8)
    end

    it "timeout should be a default" do
      expect(config.timeout).to eq(10)
    end

    it "timeout_proc should be a default" do
      expect(config.timeout_proc).to eq(:raise)
    end
  end

  describe "#configure" do
    before do
      config.configure do |c|
        c.threads = 20
        c.timeout = 30
        c.timeout_proc = :ignore
      end
    end

    it "threads should be a specified parameter" do
      expect(config.threads).to eq(20)
    end

    it "timeout should be a specified parameter" do
      expect(config.timeout).to eq(30)
    end

    it "timeout_proc should be a specified parameter" do
      expect(config.timeout_proc).to eq(:ignore)
    end

    it "raise error unknown setting" do
      expect {
        config.configure do |c|
          c.unknown = true
        end
      }.to raise_error
    end
  end

  describe "#reset" do
    before do
      config.configure do |c|
        c.threads = 20
        c.timeout = 30
        c.timeout_proc = :ignore
      end
      config.reset
    end

    it "threads should be a default" do
      expect(config.threads).to eq(8)
    end

    it "timeout should be a default" do
      expect(config.timeout).to eq(10)
    end

    it "timeout_proc should be a default" do
      expect(config.timeout_proc).to eq(:raise)
    end
  end
end
