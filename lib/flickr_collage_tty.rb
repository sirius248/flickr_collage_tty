require "flickr_collage_tty/version"
require "flickr_collage_tty/generator"
require "flickr_collage_tty/configuration"
require 'flickr_collage_tty/dictionary'

module FlickrCollageTty
  def self.generate_collage(keywords)
    FlickrCollageTty.set_flickr_api_credentials
    FlickrCollageTty::Dictionary.load
    FlickrCollageTty::Flickr.create
    FlickrCollageTty::Generator.call(keywords)
  end

  def self.set_flickr_api_credentials
    FlickRaw.api_key = FlickrCollageTty.configuration.api_key
    FlickRaw.shared_secret = FlickrCollageTty.configuration.api_secret
  end
end
