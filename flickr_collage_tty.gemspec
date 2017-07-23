# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickr_collage_tty/version'

Gem::Specification.new do |spec|
  spec.name          = "flickr_collage_tty"
  spec.version       = FlickrCollageTty::VERSION
  spec.authors       = ["Long Nguyen"]
  spec.email         = ["long.polyglot@gmail.com"]

  spec.summary       = %q{Create collage images from Flickr.}
  spec.description   = %q{Create collage images from Flickr.}
  spec.homepage      = "https://github.com/kimquy/flickr_collage_tty"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = "exec"
  spec.executables   = ["fc_tty"]
  spec.require_paths = ["lib"]

  spec.add_dependency "flickraw"
  spec.add_dependency "tty"
  spec.add_dependency "rmagick-screwdrivers"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
end
