module ProblemThree

  def self.is_prime(number)
    prime = true
    range = *1...number

    # Check if any of the number are divisble into the original number.
    range.each do |r|
      if r%number == 0
        is_prime = false
      end
    end

    prime
  end

end
