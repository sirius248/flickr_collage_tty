require 'rmagick/screwdrivers'

class FlickrCollageTty::Assembler
  RESULT = "/tmp/collage.jpg"
  COLLAGE_DIR = "/tmp/flickr_collages"
  OPTIONS = {
    output: RESULT,
    columns: 5,
    rotate_angle: 0,
    scale_range: 0.2,
    thumb_width: 300
  }

  def self.call
    Magick::Screwdrivers.collage(COLLAGE_DIR, OPTIONS).write(OPTIONS[:output])
  end
end
