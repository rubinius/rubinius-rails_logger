# Rubinius::RailsLogger

Logging is essential to monitoring and debugging an application. However,
logging infrastructure is often limited. For example, the libc syslog()
facility can only be opened once in a process. This prevents Rubinius from
using syslog independently of the appliation running on Rubinius. Furthermore,
configuring a process for logging is a operations-level concern, not an
application concern.

Rubinius includes a logging facility that Rubinius uses internally. An API for
the facility is exposed to Ruby code. The logger can be configured to use
syslog(), as well as STDOUT, STDERR or a file.

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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rubinius-rails_logger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
