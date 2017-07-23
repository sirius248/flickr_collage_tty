require 'spec_helper'

RSpec.describe FlickrCollageTty::Generator do
  let(:keywords) { %w[cat dog] }
  let(:output) { "./test.jpg" }

  before do
    FlickrCollageTty.configure do |config|
      config.api_key = ENV["flickr_api_key"]
      config.api_secret = ENV["flickr_api_secret"]
    end
    FlickrCollageTty::Flickr.set_credentials
    FlickrCollageTty::Flickr.create
    FlickrCollageTty::Dictionary.load
  end

  describe ".call" do
    it "generate a collage" do
      expect(FlickrCollageTty::ImagesAggregator).to receive(:call).with(
        keywords,
        FlickrCollageTty::Flickr.instance,
        FlickrCollageTty::Dictionary.instance
      )
      expect(FlickrCollageTty::Downloader).to receive(:call)
      expect(FlickrCollageTty::Assembler).to receive(:call).with(output)
      FlickrCollageTty::Generator.call(keywords, output)
    end
  end
end
