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
  end

  def self.api_key_given?
    @configuration &&
    @configuration.api_key &&
    @configuration.api_secret
  end
end
