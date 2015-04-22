# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3,5,6,9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

module ProblemOne
  def self.multiples_sum(multiples, range)
    range_array = *range
    multiples_array = multiples
    multiple_matches = []

    range_array.each do |r|
      multiples_array.each do |m|
        if r%m == 0
          multiple_matches << r
          next
        end
      end
    end

    [multiple_matches,multiple_matches.inject { |sum, x| sum + x }]
  end

  def self.sum_array(values)
    values.inject { |sum, x| sum + x }
  end
end
