class Rubic

  attr_reader :category, :weight, :grades

  def initialize(category, weight)
    @category = category
    @weight = weight

    @grades = []
  end

  def add_grade(value)
    @grades << value
  end

  def calculate_points_by_sum(number)
    number * weighted_decimal
  end

  def calculate_points
    grade_sum = @grades.inject{ |sum, x| sum + x }
    return calculate_points_by_sum(grade_sum)
  end

  def weighted_decimal
    @weight / 100.0
  end

  def ==(other)
    self.category == other.category
  end

end
