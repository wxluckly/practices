require 'rubygems'
require 'RMagick'
img = Magick::Image.ping("http://211.100.52.196/images/random_bg/05.jpg")[0]

p img.rows
p img.columns 