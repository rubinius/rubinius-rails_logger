# Rubinius::RailsLogger

Logging is essential to monitoring and debugging an application. However,
logging infrastructure is often limited. For example, the libc `syslog()`
facility can only be opened once in a process. This prevents Rubinius from
using syslog independently of the appliation running on Rubinius.
Additionally, concurrent access to the `syslog()` needs to be synchronized.
Finally, configuring a process for logging is a operations-level concern, not
an application concern.

Rubinius includes a logging facility that Rubinius uses internally. An API for
the facility is exposed to Ruby code. The logger can be configured to use
`syslog()`, as well as STDOUT, STDERR or a file. Support for newer logging
facilities like syslog-ng is planned.

The Rubinius::RailsLogger gem provides an adapter for Rails logging that uses
the built-in Rubinius logging facility. Some operations are no-ops (eg
changing the log level at runtime is not supported).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubinius-rails_logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubinius-rails_logger

## Usage

Set Rails to use the logger:

    # config/environments/production.rb
    config.logger = Rubinius::RailsLogger.new "app-name"

Use the same logging API you would expect with, for example, SyslogLogger:

    # assume logger is an instance of Rubinius::RailsLogger.

    # RailsLogger#write outputs to the log independent of log level.
    logger.write "some text"
    logger.write { "some text" }

    # Other methods only output if the related log level is set. All these
    # methods can take a block instead of a message.
    logger.fatal "some text"
    logger.error "some text"
    logger.warn "some text"
    logger.info "some text
    logger.debug "some text"

    # Log level predicates are also available.
    logger.fatal?   # => returns true if fatal messages are logged
    logger.error?
    logger.warn?
    logger.info?
    logger.debug?

    # The following attributes are no-ops, but provided for compatibility. The
    # log level is set at process invocation and cannot be changed. The program
    # name is set when the logger is created.
    logger.formatter
    logger.formatter=
    logger.level
    logger.level=
    logger.progname
    logger.progname=

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release` to create a git tag for the version, push git
commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## License

Mozilla Public License, version 2.0. See the LICENSE file for details.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rubinius-rails_logger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
