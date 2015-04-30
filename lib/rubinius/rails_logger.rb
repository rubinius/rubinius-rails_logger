require "rubinius/rails_logger/version"

module Rubinius
  module RailsLogger
    def initialize(name)
      @logger = Rubinius::Logger.new name
    end

    def log(severity, message, &block)
      message = yield if block_given?
      @logger.send severity, message
    end

    def write(message, &block)
      message = yield if block_given?
      @logger.write message
    end

    alias_method :unknown, :write

    def fatal(message, &block)
      log(:fatal, message, &block)
    end

    def error(message, &block)
      log(:error, message, &block)
    end

    def warn(message, &block)
      log(:warn, message, &block)
    end

    def info(message, &block)
      log(:info, message, &block)
    end

    def debug(message, &block)
      log(:debug, message, &block)
    end
  end
end
