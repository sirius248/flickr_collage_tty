require 'spec_helper'

RSpec.describe FlickrCollageTty::Flickr do
  before do
    FlickrCollageTty.configure do |config|
      config.api_key = ENV["flickr_api_key"]
      config.api_secret = ENV["flickr_api_secret"]
    end
  end

  describe ".create" do
    before do
      FlickrCollageTty::Flickr.set_credentials
    end

    it "create a flickr instance" do
      flickr_instance = FlickrCollageTty::Flickr.create
      expect(flickr_instance).to be_an_instance_of(FlickrCollageTty::Flickr)
    end
  end

  describe ".set_credentials" do
    it "set flickr credentials info" do
      FlickrCollageTty::Flickr.set_credentials
      expect(FlickRaw.api_key).not_to eq(nil)
      expect(FlickRaw.shared_secret).not_to eq(nil)
    end
  end

  describe "#search" do
    let(:keyword) { "cat" }

    before do
      FlickrCollageTty::Flickr.set_credentials
    end

    it "searchs the image and return an image url" do
      flickr_instance = FlickrCollageTty::Flickr.create

      result = flickr_instance.search(text: keyword)

      # expect(result).to include("http")
      expect(result).to include("jpg")
    end
  end
end
