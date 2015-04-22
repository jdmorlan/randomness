require 'minitest/autorun'
require_relative '../rubic'

class RubicTest < Minitest::Test

  describe Rubic do

    before do
      @rubic = Rubic.new(:homework, 30)
    end

    describe "#category" do
      it "returns the category for the rubic" do
        @rubic.category.must_equal :homework
      end
    end

    describe "#weight" do
      it "returns the percentage for the weight of the rubic" do
        @rubic.weight.must_equal 30
      end
    end

    describe "#weighted_decimal" do
      it "returns the weight percentage in decimal format" do
        @rubic.weighted_decimal.must_equal 0.30
      end
    end

    describe "#add_grade" do
      it "adds a grade to the rubic" do
        @rubic.add_grade(100)
        @rubic.grades.size.must_equal 1
      end
    end

    describe "#calculate_points" do
      it "calculates the number of points based on the sum of the grades, and the weight of the rubic" do
        @rubic.add_grade(100)
        @rubic.calculate_points.must_equal 30
      end

      it "calculates the number of points based on multiple grades, and the weight of the rubic" do
        @rubic.add_grade(100)
        @rubic.add_grade(85)
        @rubic.add_grade(90)
        @rubic.calculate_points.must_equal 82.5
      end
    end

    describe "#==" do
      it "returns if two rubic objects are equal based on their category" do
        @rubic_a = Rubic.new(:homework, 30)
        are_equal = @rubic == @rubic_a
        are_equal.must_equal true
      end
    end

    describe "#!=" do
      it "returns true when two rubics are not equal based on their category" do
        @rubic_a = Rubic.new(:exam_1, 30)
        are_not_equal = @rubic != @rubic_a
        are_not_equal.must_equal true
      end
    end
  end
end
