require 'flickr_collage_tty/utils/credential_storage'
require 'flickr_collage_tty/flickr'

module FlickrCollageTty
  class Configuration
    attr_accessor :api_key, :api_secret

    def initialize
      self.api_key = nil
      self.api_secret = nil
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?

    begin
      FlickrCollageTty::Flickr.set_credentials
      FlickRaw::Flickr.new

      FlickrCollageTty::Utils::CredentialStorage.write(
        key: configuration.api_key,
        secret: configuration.api_secret
      )
    rescue
      TTY::Prompt.new.say("Invalid Flickr API credentials.")
      exit(1) unless ENV["environment"] == "test"
    end
  end

  def self.api_key_given?
    @configuration &&
    @configuration.api_key &&
    @configuration.api_secret
  end

  def self.load_cached_flickr_credentials
    credentials = FlickrCollageTty::Utils::CredentialStorage.load
    if credentials
      configure do |config|
        config.api_key = credentials[:api_key]
        config.api_secret = credentials[:api_secret]
      end
    end
  end
end
