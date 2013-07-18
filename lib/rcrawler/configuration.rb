# coding: utf-8

require "singleton"

module RCrawler
  class Configuration
    VALID_OPTIONS_KEYS = [
      :threads,
      :timeout,
      :timeout_proc
    ].freeze

    attr_accessor *VALID_OPTIONS_KEYS

    include Singleton

    def initialize
      reset
    end

    def configure
      yield self
    end

    def reset
      self.threads = 8
      self.timeout = 10
      self.timeout_proc = :raise
    end
  end
end