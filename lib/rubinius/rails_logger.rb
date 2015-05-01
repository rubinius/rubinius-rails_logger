require "rubinius/rails_logger/version"

module Rubinius
  class RailsLogger
    # These operations are no-ops but provided for method-call compatibility.
    attr_accessor :formatter, :level, :progname

    def initialize(name)
      @logger = Rubinius::Logger.new name
      @level = :warn
    end

    def fatal?
      false
    end

    def error?
      false
    end

    def warn?
      true
    end

    def info?
      false
    end

    def debug?
      false
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
