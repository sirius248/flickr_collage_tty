class FlickrCollageTty::Dictionary
  class << self
    attr_accessor :dictionary_url, :instance

    def load(path = '/usr/share/dict/words')
      self.dictionary_url = path
      self.instance = new(path)
    end
  end

  attr_reader :data

  def sample
    data.sample
  end

  private

  def initialize(path)
    @path = path
    @data = load
  end

  def load
    return [] unless File.exist?(@path)
    File.readlines(@path).map(&:strip)
  end
end
