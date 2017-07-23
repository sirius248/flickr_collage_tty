require 'rmagick/screwdrivers'

class FlickrCollageTty::Assembler
  COLLAGE_DIR = "/tmp/flickr_collages"

  def self.call(output)
    new(output).call
  end

  def initialize(output)
    @output = output
  end

  def call
    create_collage
    clean_up
    success_message
  end

  private

  def options
    {
      output: @output,
      columns: 5,
      rotate_angle: 0,
      scale_range: 0.2,
      thumb_width: 250
    }
  end

  def clean_up
    0.upto(9).each do |i|
      TTY::File.remove_file("#{COLLAGE_DIR}/collage_#{i}.jpg")
    end
  end

  def create_collage
    Magick::Screwdrivers.collage(COLLAGE_DIR, options).write(options[:output])
  end

  def success_message
    TTY::Prompt.new.say("Created a collage success! You can look at the image at #{@output}")
  end
end
