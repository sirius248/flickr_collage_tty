require 'spec_helper'

RSpec.describe FlickrCollageTty::Utils::CredentialStorage do
  describe ".write" do
    let(:key) { "acbd" }
    let(:secret) { "acbd" }
    let(:data) {
      { api_key: key, api_secret: secret }.to_yaml
    }

    it "write credential to yaml file" do
      expect(TTY::File).to receive(:create_file)
                            .with(described_class::DEFAULT_STORAGE, data)

      described_class.write(key: key, secret: secret)
    end
  end

  describe ".load" do
    it "loads yaml file from default storage" do
      expect(YAML).to receive(:load_file).with(described_class::DEFAULT_STORAGE)
      described_class.load
    end
  end
end
