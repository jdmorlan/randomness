require_relative './lib/rubic'

class Course

  def initialize(title, rubics=[])
    @title = title
    @rubics = RubicCollection.new
  end

  def add_rubric(title, weight)
    rubic = Rubic.new(title, weight)
    @rubics.add(rubic)
  end

  def add_grade(rubic_title, grade)
    rubic = @rubics.find { |r| r.title == rubic_title }
    rubic.add_grade(grade)
  end

  def course_average
  end

  def letter_grade
    average = self.course_average
  end
end
