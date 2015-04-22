require_relative './subject'

class Course
  include Comparable

  attr_reader :subject, :course_number, :credit_hours

  def initialize(attributes={})
    @subject = attributes[:subject] || nil
    @course_number = attributes[:course_number] || nil
    @credit_hours = attributes[:credit_hours] || 0
  end

  def subject=(subject)
    raise "Subject must be of Subject class" if !subject.kind_of?(Subject)
    @subject = subject
  end

  def course_number=(course_number)
    raise "Course Number must be a Fixnum" if !course_number.kind_of?(Fixnum)
    @course_number = course_number
  end

  def credit_hours=(credit_hours)
    @credit_hours = credit_hours
  end

  def ==(other)
    return nil unless other.is_a?(Course)
    self.subject == other.subject && self.course_number == other.course_number
  end

  def <=>(other)
    return nil unless other.is_a?(Course)

    # See if the subject titles are the same
    # if they are the same it will return 0
    # if self is greater than other, it will return -1
    # if other is greater than self, it will return 1
    comparison = self.subject <=> other.subject

    # if the subjects are the same, then compare them based on the course number.
    comparison == 0 ? self.course_number <=> other.course_number : comparison
  end

end
