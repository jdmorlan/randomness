require 'sprockets'
require 'sass'

environment = Sprockets::Environment.new
environment.append_path('C:\Users\94872\Desktop\sass')

asset = environment['base.css.scss']

puts asset.to_s
