require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new(:color => true)

require_relative '../lib/rubic'

class RubicTest < Minitest::Test

  context 'A Rubic' do

    should 'return the weight as a float value when given a Fixnum weight' do
      rubic = Rubic.new('Homework', 40)
      assert_equal(0.4, rubic.weight)
    end

    should 'return the weight as a float value when given a Float weight' do
      rubic = Rubic.new('Homework', 0.4)
      assert_equal(0.4, rubic.weight)
    end

    should 'return its title' do
      rubic = Rubic.new('Homework', 40)
      assert_equal('Homework', rubic.title)
    end

    should 'calculate the correct number of points based on the weight and grades' do
      rubic = Rubic.new('Homework', 40)
      rubic.add_grade(100)
      assert_equal(40, rubic.calculate_points)
    end
  end
end
