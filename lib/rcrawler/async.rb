# coding: utf-8

require "thread"
require "timeout"

module RCrawler
  class Async
    def initialize
      @queue = ::Queue.new
    end

    def crawl(&block)
      @queue.push block
    end

    def execute
      threads = []
      8.times do
        threads << create_thread
      end
      threads.each {|thread| thread.join}
    end

    private
    def create_thread
      ::Thread.start do
        while !@queue.empty?
          begin
            timeout(10) {exec_crawl(@queue.pop)}
          rescue Timeout::Error => e
            raise
          end
        end
      end
    end

    def exec_crawl(block)
      crwl = Crawl.new
      crwl.instance_eval &block
    end
  end
end
