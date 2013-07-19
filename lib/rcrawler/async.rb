# coding: utf-8

require "thread"

module RCrawler
  class Async
    def initialize
      @queue = ::Queue.new
      @config = ::RCrawler::Configuration.instance
    end

    def crawl(&block)
      raise ArgumentError, "crawl method is required block" unless block_given?
      @queue.push block
    end

    def execute
      threads = []
      @config.threads.times do
        threads << create_thread
      end
      threads.each {|thread| thread.join}
    end

    private
    def create_thread
      ::Thread.start do
        while !@queue.empty?
          begin
            Timeout::timeout(@config.timeout) {exec_crawl(@queue.pop)}
          rescue Timeout::Error => e
            raise if @config.timeout_proc == :raise
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
