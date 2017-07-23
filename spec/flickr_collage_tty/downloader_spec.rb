require 'spec_helper'

RSpec.describe FlickrCollageTty::Downloader do
  let(:image_urls) {
    [
      "http://www.readersdigest.ca/wp-content/uploads/2011/01/4-ways-cheer-up-depressed-cat.jpg",
      "http://media1.santabanta.com/full1/Animals/Cats/cats-85a.jpg"
    ]
  }

  describe ".call" do
    it "download the images" do
      image_urls.each_with_index do |url, i|
        expect(TTY::File).to receive(:download_file)
                              .with(url, "/tmp/flickr_collages/collage_#{i}.jpg")
                              .once
      end
      FlickrCollageTty::Downloader.call(image_urls)
    end
  end
end
