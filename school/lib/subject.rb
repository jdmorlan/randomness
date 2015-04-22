class Subject
  include Comparable

  attr_reader :title, :abbreviation

  def initialize(attributes={})
    @title = attributes[:title]
    @abbreviation = attributes[:abbreviation]
  end

  def ==(other)
    return nil unless other.is_a?(Subject)
    self.title == other.title && self.abbreviation == other.abbreviation
  end

  # See how the subjects compare to one another.
  # If this object (self) is greater than other, the method will return -1
  # If this object (self) is less than other, the method will return 1
  # If this object (self) is equal to other, the method will return 0
  def <=>(other)
    return nil unless other.is_a?(Subject)
    self.abbreviation <=> other.abbreviation
  end

end
