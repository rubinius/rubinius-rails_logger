# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubinius/rails_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "rubinius-rails_logger"
  spec.version       = Rubinius::RailsLogger::VERSION
  spec.authors       = ["Brian Shirai"]
  spec.email         = ["brixen@gmail.com"]

  spec.summary       = %q{Rubinius RailsLogger is a logging adapter to the Rubinius logging facility for use with Rails 4+.}
  spec.description   = %q{Rubinius includes a logging facility that is used by Rubinius itself. Due to limitations of logging facilities like syslog (where syslog can only be opened once in a process), the Rubinius RailsLogger provides a Rails-compatible logger API that uses the built-in Rubinius logging facility.}
  spec.homepage      = "https://github.com/rubinius/rubinius-rails_logger"
  spec.license       = "MPL/2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
