# FlickrCollageTty

[![Code Climate](https://codeclimate.com/github/kimquy/flickr_collage_tty/badges/gpa.svg)](https://codeclimate.com/github/kimquy/flickr_collage_tty)

[![Build Status](https://travis-ci.org/kimquy/flickr_collage_tty.svg?branch=master)](https://travis-ci.org/kimquy/flickr_collage_tty)

FlickrCollageTty allow you to create a collage from keywords you enter into the terminal. Then it will fetch the most suitable image from Flickr correspond to each keyword.


![screenshot](https://user-images.githubusercontent.com/2282642/28498501-2c64cce4-6fc9-11e7-889a-1d4dbe1069f3.jpg)

## Installation

    $ gem install flickr_collage_tty

## Requirements

In order to this gem to work the following things are required:

* ImageMagick
* Flickr API key

## Usage

```ruby
# Simply run the following command into the terminal
# Then follow the instruction of the programm

# The program will ask for the Flickr API credentials
# for the first time. If it successful authenticate, then
# the program will not ask for the credentials again.

fc_tty
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kimquy/flickr_collage_tty. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
