# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'erb/view/version'

Gem::Specification.new do |spec|
  spec.name          = 'erb-view'
  spec.version       = Erb::View::VERSION
  spec.authors       = ['Felipe Philipp']
  spec.email         = ['felipeelias@gmail.com']

  spec.summary       = 'Create class based ERB views'
  spec.description   = 'Simple wrapper around ERB that lets you create class based views'
  spec.homepage      = 'https://github.com/felipeelias/erb-view'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-rg', '~> 5.0'
end
