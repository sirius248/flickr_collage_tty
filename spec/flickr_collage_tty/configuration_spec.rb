require 'spec_helper'

RSpec.describe FlickrCollageTty::Configuration, order: :defined do
  describe ".configure" do
    let(:error_msg) { "Invalid Flickr API credentials." }

    context "invalid credentials" do
      let(:api_key) { "abcd" }
      let(:api_secret) { "abcd" }

      it "does not store the key" do
        expect_any_instance_of(TTY::Prompt).to receive(:say).with(error_msg)
        expect(FlickrCollageTty::Utils::CredentialStorage).not_to receive(:write)

        FlickrCollageTty.configure do |config|
          config.api_key = api_key
          config.api_secret = api_secret
        end
      end
    end

    context "valid credentials" do
      let(:api_key) { ENV["flickr_api_key"] }
      let(:api_secret) { ENV["flickr_api_secret"] }

      it "store the key" do
        expect_any_instance_of(TTY::Prompt).not_to receive(:say).with(error_msg)
        expect(FlickrCollageTty::Utils::CredentialStorage).to receive(:write)

        FlickrCollageTty.configure do |config|
          config.api_key = api_key
          config.api_secret = api_secret
        end
      end
    end
  end
end
