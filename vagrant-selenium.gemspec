# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-selenium/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-selenium"
  spec.version       = VagrantPlugins::Selenium::VERSION
  spec.authors       = ["David Saenz Tagarro"]
  spec.email         = ["david.saenz.tagarro@gmail.com"]
  spec.summary       = %q{Vagrant plugin for running selenium server on host machines.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/dsaenztagarro/vagrant-selenium"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rubocop", "~> 0.26.0"
  spec.add_development_dependency "pry"

end
