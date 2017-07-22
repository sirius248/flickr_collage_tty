require "flickr_collage_tty/version"
require "flickr_collage_tty/generator"
require "flickr_collage_tty/configuration"
require 'flickr_collage_tty/dictionary'

module FlickrCollageTty
  def self.generate_collage(keywords, output)
    FlickrCollageTty::Flickr.set_credentials
    FlickrCollageTty::Flickr.create
    FlickrCollageTty::Dictionary.load
    FlickrCollageTty::Generator.call(keywords, output)
  end
end
