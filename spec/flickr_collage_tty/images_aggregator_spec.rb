require 'spec_helper'

RSpec.shared_examples "images aggregation" do
  it "aggreates 10 image urls" do
    image_urls = described_class.call(keywords, flickr_instance, dictionary_instance)
    image_urls.each do |image_url|
      expect(image_url).to include("http")
    end
    expect(image_urls.size).to eq(10)
  end
end

RSpec.describe FlickrCollageTty::ImagesAggregator do
  describe ".call" do
    before do
      FlickrCollageTty.configure do |config|
        config.api_key = ENV["flickr_api_key"]
        config.api_secret = ENV["flickr_api_secret"]
      end
      FlickrCollageTty::Flickr.set_credentials
      FlickrCollageTty::Flickr.create
      FlickrCollageTty::Dictionary.load
    end

    let(:flickr_instance) { FlickrCollageTty::Flickr.instance }
    let(:dictionary_instance) { FlickrCollageTty::Dictionary.instance }

    context "when input keywords are less than 10" do
      let(:keywords) { %w[cat dog] }
      it_behaves_like "images aggregation"
    end

    context "when input keywords are 10" do
      let(:keywords) {
        %w[cat dog pig follower computer television lamp paper phone picture]
      }

      it_behaves_like "images aggregation"
    end
  end
end
