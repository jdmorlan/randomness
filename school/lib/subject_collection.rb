class SubjectCollection

  def initialize
    @subjects = []
  end

  def add(subject)
    @subjects << subject
  end

  # Returns the courses in sorted order based on the comparison (<=>) operator
  # provided in the `Subject` class.
  def subjects
    @subjects
  end

end
