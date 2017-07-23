require 'rmagick/screwdrivers'

class FlickrCollageTty::Assembler
  COLLAGE_DIR = "/tmp/flickr_collages"

  def self.call(output, tmp_folder = COLLAGE_DIR)
    new(output, tmp_folder).call
  end

  def initialize(output, tmp_folder)
    @output = output
    @tmp_folder = tmp_folder
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
      TTY::File.remove_file("#{@tmp_folder}/collage_#{i}.jpg")
    end
  end

  def create_collage
    Magick::Screwdrivers.collage(@tmp_folder, options).write(options[:output])
  end

  def success_message
    TTY::Prompt.new.say("Created a collage success! You can look at the image at #{@output}")
  end
end
