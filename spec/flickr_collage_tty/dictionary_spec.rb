require 'spec_helper'

RSpec.describe FlickrCollageTty::Dictionary do
  let(:dictionary_path) {
    File.expand_path('../../fixtures/dictionary.txt', __FILE__)
  }

  let(:data) {
    %w[dog cat book lamb picture television phone laptop
    wallet key magazine paper table].sort
  }

  describe ".load" do
    it "loads dictionary from the path" do
      dictionary = FlickrCollageTty::Dictionary.load(dictionary_path)
      expect(dictionary.data.sort).to eq(data)
    end
  end

  describe "#sample" do
    let(:dictionary) { FlickrCollageTty::Dictionary.load(dictionary_path) }
    let(:keyword) { dictionary.sample }

    it "get a word from the dictionary" do
      expect(dictionary.data).to include(keyword)
    end
  end
end
