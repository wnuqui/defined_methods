# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'defined_methods/version'

Gem::Specification.new do |spec|
  spec.name          = 'defined_methods'
  spec.version       = DefinedMethods::VERSION
  spec.authors       = ['Wilfrido T. Nuqui Jr.']
  spec.email         = ['nuqui.dev@gmail.com']

  spec.summary       = 'A util library that returns the methods defined in an object.'
  spec.description   = 'A util library that returns the methods defined in an object.'
  spec.homepage      = 'https://github.com/wnuqui/defined_methods'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'simplecov'
end
