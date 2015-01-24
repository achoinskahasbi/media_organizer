# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'media_organizer/version'

Gem::Specification.new do |spec|
  spec.name             = "media_organizer"
  spec.version          = MediaOrganizer::VERSION
  spec.authors          = ['ACH']
  spec.email            = ['anna@choinska.com']
  spec.summary          = 'Media Oragnizer'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'exifr'
  spec.add_dependency 'geokit'
  spec.add_dependency 'geocoder'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
