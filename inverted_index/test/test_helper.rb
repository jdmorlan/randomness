require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(:color => true)

require_relative '../lib/inverted_index'
