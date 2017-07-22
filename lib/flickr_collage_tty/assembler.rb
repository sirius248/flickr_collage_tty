require 'rmagick/screwdrivers'

class FlickrCollageTty::Assembler
  COLLAGE_DIR = "/tmp/flickr_collages"

  def self.call(output)
    options = {
      output: output,
      columns: 5,
      rotate_angle: 0,
      scale_range: 0.2,
      thumb_width: 250
    }

    Magick::Screwdrivers.collage(COLLAGE_DIR, options).write(options[:output])
  end
end
