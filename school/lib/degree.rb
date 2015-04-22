class Degree

  def initialize(title, degree_type)
    @title = title
    @degree_type = degree_type
    @courses = CourseCollection.new
  end

  def courses
    @courses.courses
  end

  def credit_hours
    sum = 0
    @courses.each do |course|
      sum += course.credit_hours
    end

    return sum
  end

end
