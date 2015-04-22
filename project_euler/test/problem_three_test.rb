require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda'

require_relative '../exercises/problem_three'

class ProblemThreeTest < Minitest::Test

  context 'Problem One' do

    should 'identify prime numbers' do
      assert_equal(true, ProblemThree::is_prime(2))
      assert_equal(true, ProblemThree::is_prime(3))
      assert_equal(false, ProblemThree::is_prime(4))
      assert_equal(true, ProblemThree::is_prime(5))
      assert_equal(true, ProblemThree::is_prime(7))
      assert_equal(true, ProblemThree::is_prime(13))
      assert_equal(true, ProblemThree::is_prime(29))
    end
  end
end
