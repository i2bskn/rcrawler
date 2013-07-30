# coding: utf-8

require "digest/sha1"

module RCrawler
  class CLI < Thor
    desc "sc http://example.com", "Get a screen shot"
    long_desc <<-LONGDESC
    `sc` is get a screen shot. Save to current directory if filename not specified.
    LONGDESC
    option :output, aliases: "-o", type: :string, desc: "Output filename."
    def sc(url)
      filename = options.fetch("output", "#{Digest::SHA1.hexdigest(url)}.png")
      RCrawler.crawl do
        screenshot(url, filename)
      end
    end
  end
end
