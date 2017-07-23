require 'yaml'

module FlickrCollageTty
  module Utils
    class CredentialStorage
      DEFAULT_STORAGE = "#{Dir.home}/.fc_tty.yaml"

      class << self
        def write(key:, secret:)
          data = { api_key: key, api_secret: secret }.to_yaml
          TTY::File.create_file(DEFAULT_STORAGE, data)
        end

        def load
          YAML.load_file(DEFAULT_STORAGE)
        rescue
          nil
        end
      end
    end
  end
end
