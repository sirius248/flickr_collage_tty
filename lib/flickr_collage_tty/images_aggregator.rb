require 'flickr_collage_tty/utils/spinner'

module FlickrCollageTty
  class ImagesAggregator
    def self.call(keywords, flickr, dictionary)
      new(keywords, flickr, dictionary).call
    end

    attr_reader :keywords, :flickr, :image_urls, :dictionary

    def initialize(keywords, flickr, dictionary)
      @keywords   = keywords
      @flickr     = flickr
      @dictionary = dictionary
      @image_urls = []
    end

    def call
      FlickrCollageTty::Utils::Spinner.start(message: "Aggregating image urls ...")

      keywords.each do |keyword|
        get_new_image_url(keyword)
      end

      while image_urls.size < 10
        keyword = dictionary.sample
        get_new_image_url(keyword)
      end

      FlickrCollageTty::Utils::Spinner.stop(message: "Finish aggregate image urls!")
      
      image_urls
    end

    private

      def get_new_image_url(keyword)
        url = flickr.search(text: keyword)
        image_urls << url if url
      end
  end
end
