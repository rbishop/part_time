# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'part_time/version'

Gem::Specification.new do |spec|
  spec.name          = "part_time"
  spec.version       = PartTime::VERSION
  spec.authors       = ["Richard Bishop"]
  spec.email         = ["rbishop87@gmail.com"]
  spec.description   = %q{An In-memory background job processing library for Ruby applications that just don't work that hard.}
  spec.summary       = %q{Lightweight, threaded in-memory background job processing}
  spec.homepage      = "https://github.com/rjbishop/part_time"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0.8"
  spec.add_development_dependency "mocha", "~> 0.14.0"
end
