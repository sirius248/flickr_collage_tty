class FlickrCollageTty::Downloader
  def self.call(image_urls)
    new(image_urls).call
  end

  attr_reader :image_urls

  def initialize(image_urls)
    @image_urls = image_urls
  end

  def call
    FlickrCollageTty::Utils::Spinner.start(message: "Downloading image urls ...")

    image_urls.each_with_index do |url, index|
      puts "Downloading image from: #{url}"
      TTY::File.download_file(url, "/tmp/flickr_collages/collage_#{index}.jpg")
    end

    FlickrCollageTty::Utils::Spinner.stop(message: "Finish download images!")
  end
end
