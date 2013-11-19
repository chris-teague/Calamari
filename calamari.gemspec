# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calamari/version'

Gem::Specification.new do |gem|
  gem.name          = "Calamari"
  gem.version       = Calamari::VERSION
  gem.authors       = ["chris-teague"]
  gem.description   = %q{Have fun with PostGIS in location centric Rails apps!}
  gem.summary       = %q{An opinionated set of AR extensions to ease the use of PostGIS in Rails applications}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # Runtime Depedencies
  gem.add_runtime_dependency 'pg'
  gem.add_runtime_dependency 'activerecord-postgis-adapter'
  gem.add_runtime_dependency 'rgeo'
  gem.add_runtime_dependency 'rails'

  # Development Dependencies
  gem.add_development_dependency 'factory_girl', '~> 4.1.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'cover_me'
end
