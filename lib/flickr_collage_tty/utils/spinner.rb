module FlickrCollageTty
  module Utils
    class Spinner
      class << self
        attr_accessor :instance
      end

      def self.start(message:)
        self.instance ||= TTY::Spinner.new
        puts message
        self.instance.auto_spin
      end

      def self.stop(message:)
        self.instance.stop(message)
      end
    end
  end
end
