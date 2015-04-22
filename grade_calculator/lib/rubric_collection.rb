class RubicCollection
  include Enumerable

  def initialize
    @rubics = []
  end

  def add(rubic)
    @rubics << rubic
  end

  def each(&block)
    @rubics.each { |r| block.call(r) }
  end


end
