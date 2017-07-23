class FlickrCollageTty::Downloader
  def self.call(image_urls)
    FlickrCollageTty::Utils::Spinner.start(message: "Downloading image urls ...")

    image_urls.each_with_index do |url, index|
      TTY::Prompt.new.say("Downloading image from: #{url}")
      TTY::File.download_file(url, "/tmp/flickr_collages/collage_#{index}.jpg")
    end

    FlickrCollageTty::Utils::Spinner.stop(message: "Finish download images!")
  end
end
