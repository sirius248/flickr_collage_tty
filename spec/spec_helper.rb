require "bundler/setup"
require 'tty'
require "flickr_collage_tty"
require "flickr_collage_tty/flickr"
require 'flickr_collage_tty/configuration'
require 'flickr_collage_tty/dictionary'
require 'flickr_collage_tty/images_aggregator'
require 'flickr_collage_tty/utils/spinner'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
