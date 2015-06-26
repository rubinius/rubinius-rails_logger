require "rubinius/rails_logger/version"

module Rubinius
  class RailsLogger
    # provided for method-call compatibility, formatter and level are no-ops
    attr_accessor :formatter, :level, :progname

    def initialize(name)
      @progname = name
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

    def add(severity, message = nil, program_name = nil, &block)
      program_name ||= progname

      if message.nil?
        message = if block_given?
          yield
        else
          program_name
        end
      end

      log(severity, message)
    end

    def log(severity, message, &block)
      message = yield if block_given?
      @logger.send severity, message
    end

    def write(message=nil, &block)
      message = yield if block_given?
      @logger.write message
    end

    alias_method :unknown, :write

    def fatal(message=nil, &block)
      log(:fatal, message, &block)
    end

    def error(message=nil, &block)
      log(:error, message, &block)
    end

    def warn(message=nil, &block)
      log(:warn, message, &block)
    end

    def info(message=nil, &block)
      log(:info, message, &block)
    end

    def debug(message=nil, &block)
      log(:debug, message, &block)
    end
  end
end
