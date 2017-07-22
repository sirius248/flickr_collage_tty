require 'flickr_collage_tty/downloader'
require 'flickr_collage_tty/images_aggregator'
require 'flickr_collage_tty/flickr'
require 'flickr_collage_tty/assembler'

class FlickrCollageTty::Generator
  def self.call(keywords)
    image_urls = FlickrCollageTty::ImagesAggregator.call(
      keywords,
      FlickrCollageTty::Flickr.instance,
      FlickrCollageTty::Dictionary.instance
    )
    FlickrCollageTty::Downloader.call(image_urls)
    FlickrCollageTty::Assembler.call
  end
end
