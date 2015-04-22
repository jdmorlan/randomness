require 'ostruct'
require_relative './test_helper'

class InvertedIndexTest < Minitest::Test

  context 'A Inverted Index' do

    setup do
      @templates = []
      @templates << OpenStruct.new(:name => 'quote', :type => 'template', :path => 'templates/quote.erb')
      @templates << OpenStruct.new(:name => 'default', :type => 'layout', :path => 'templates/default.erb')

      @index = InvertedIndex.new(@templates, [:name, :type])
    end

    should 'allow you to add a property after initialization' do
      @index.add_property(:path)
      template = @index.find(:path => 'templates/quote.erb')
      assert_equal 'quote', template.name
    end

    should 'allow you to add a data item after initialization' do
      new_template = OpenStruct.new(:name => 'customer', :type => 'template', :path => 'templates/quote.erb')
      @index.add_raw_data(new_template)

      template = @index.find(:name => 'customer')
      assert_equal 'customer', template.name
    end

  end

end
