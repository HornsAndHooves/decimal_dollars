# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decimal_dollars/version'

Gem::Specification.new do |spec|
  spec.name          = "decimal_dollars"
  spec.version       = DecimalDollars::VERSION
  spec.authors       = ["Roman Trofimov"]
  spec.email         = ["trofimov.roman@gmail.com"]
  spec.summary       = "Money representation that uses decimal math."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/HornsAndHooves/decimal_dollars"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "yard"
end
