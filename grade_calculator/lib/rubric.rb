class Rubic

  attr_reader :id, :title, :weight

  # You can provide the weight as a integer percentage 40 meaning 40%, or
  # in decimal form. Therefore, 40% would be 0.4
  def initialize(title, weight)
    @grades = []
    @title = title

    # If the weight is an Integer convert it to a Float,
    # else if is a float then pass it on unchanged.
    @weight = weight.is_a?(Fixnum) ? weight/100.0 : weight
  end

  def add_grade(grade)
    @grades << grade
  end

  def calculate_points
    grade_sum = @grades.inject { |sum, x| sum + x }
    return grade_sum * @weight
  end

end
