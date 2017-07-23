require 'flickraw'

class FlickrCollageTty::Flickr
  class << self
    attr_accessor :instance

    def create
      self.instance = new
    end

    def set_credentials
      FlickRaw.api_key = FlickrCollageTty.configuration.api_key
      FlickRaw.shared_secret = FlickrCollageTty.configuration.api_secret
    end
  end

  def search(text:)
    options = {
      text: text,
      sort: "interestingness-desc",
      content_type: 1,
      media: :photos
    }

    response = @flickr.photos.search(options).first
    get_photo_url_from(flick_raw_response: response)
  end

  private

  def initialize
    @flickr = FlickRaw::Flickr.new
  end

  def get_photo_url_from(flick_raw_response:)
    @flickr.photos.getSizes(photo_id: flick_raw_response.id)[-1].source
  rescue
    nil
  end
end
