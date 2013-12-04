# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redirector/version'

Gem::Specification.new do |spec|
  spec.name          = "redirector"
  spec.version       = Redirector::VERSION
  spec.authors       = ["Dougal MacPherson"]
  spec.email         = ["dougal@jtribe.com.au"]
  spec.description   = "Handles our new wesites stale urls"
  spec.summary       = "Simple rack middleware to handle our sites stale urls"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
