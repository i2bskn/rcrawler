# coding: utf-8

require "spec_helper"

describe RCrawler::CLI do
  describe "#sc" do
    let(:url) {"http://example.com"}
    it "default filename should be a hashed url" do
      args = ["sc", url]
      RCrawler::Driver.any_instance.should_receive(:screenshot).with(url, "#{Digest::SHA1.hexdigest(url)}.png")
      expect {
        RCrawler::CLI.start(args)
      }.not_to raise_error
    end

    it "output filename should be a specified filename" do
      args = ["sc", url, "-o", "example.png"]
      RCrawler::Driver.any_instance.should_receive(:screenshot).with(url, "example.png")
      expect {
        RCrawler::CLI.start(args)
      }.not_to raise_error
    end
  end
end