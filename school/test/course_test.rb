require 'minitest/autorun'
require_relative '../lib/course'

describe Course do

  before do
    @mathematics = Subject.new(:title => 'Mathematics', :abbreviation => 'MATH')


    @college_algebra = Course.new
    @college_algebra.subject = @mathematics
    @college_algebra.course_number = 1314
    @college_algebra.credit_hours = 3
  end

  describe "#subject" do
    it "returns the title of the subject" do
      @college_algebra.subject.title.must_equal 'Mathematics'
    end

    it "returns the abbreviation for the subject" do
      @college_algebra.subject.abbreviation.must_equal 'MATH'
    end
  end

  describe "#<=>" do
    it "returns the correct comparison value, when subject and course number are different" do
      english = Subject.new(:title => 'English', :abbreviation => 'ENGL')
      english_comp = Course.new(:subject => english, :course_number => 1301)

      comparison_value = @college_algebra <=> english_comp
      comparison_value.must_equal 1
    end

    it "returns -1, when course_a and course_b subjects are the same, but course_a number is lower than course_b" do
      trig = Course.new(:subject => @mathematics, :course_number => 1316)

      comparison_value = @college_algebra <=> trig
      comparison_value.must_equal -1
    end

    it "returns 0, when course_a is the same as course_b" do
      college_algebra = Course.new(:subject => @mathematics, :course_number => 1314)

      comparison_value = @college_algebra <=> college_algebra
      comparison_value.must_equal 0
    end
  end
end
