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

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "flickraw"
  spec.add_dependency "tty"
  spec.add_dependency "rmagick-screwdrivers"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
end
