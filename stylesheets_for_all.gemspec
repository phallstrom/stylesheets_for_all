# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stylesheets_for_all/version'

Gem::Specification.new do |gem|
  gem.name          = "stylesheets_for_all"
  gem.version       = StylesheetsForAll::VERSION
  gem.authors       = ["Philip Hallstrom"]
  gem.email         = ["philip@pjkh.com"]
  gem.description   = %q{Enable stylesheets for all media (screen,print, etc.) by default.}
  gem.summary       = %q{Enable stylesheets for all media (screen,print, etc.) by default by defaulting to media=all}
  gem.homepage      = "https://github.com/phallstrom/stylesheets_for_all"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
