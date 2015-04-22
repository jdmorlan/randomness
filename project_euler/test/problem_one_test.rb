require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda'

require_relative '../exercises/problem_one'

class ProblemOneTest < Minitest::Test

  context 'Problem One' do

    should 'have a sum of 23 for multiples of 3 and 5 that are under 10' do
      multiples = ProblemOne::multiples_sum([3,5], 1...10)

      puts '*** Multiples Found ***'
      puts multiples[0].inspect

      assert_equal(23, multiples[1])
    end

    should 'return the sum of an array of numbers' do
      assert_equal(10, ProblemOne::sum_array([5,5]))
    end
  end
end
