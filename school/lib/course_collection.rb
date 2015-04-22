class CourseCollection

  def initialize
    @courses = []
  end

  def add(course)
    if course.kind_of?(Course) && !exists(course)
      @courses << course
    end
  end

  # Returns the courses in sorted order based on the comparison operator (<=>)
  # provided in the `Course` class.
  def courses
    return @courses.sort
  end

  def exists(course)
    @courses.any? { |c| c == course }
  end

  def find(subject, course_number)
    example_course = Course.new(subject, course_number)

    @courses.each do |course|
      if course == example_course
        return course
      end
    end
  end

  private
    def add_subject(subject)
      if !@subjects.include?(subject)
        @subjects << subject
      end
    end

end
