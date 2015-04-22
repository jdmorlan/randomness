class InvertedIndex

  def initialize(raw_data, property_list)
    @raw_data = raw_data
    @index_properties = []

    @inverted_index = build_index
  end

  def add_property(property)
    @property_list << property
    self.refresh
  end

  def add_raw_data(item)
    @raw_data << item
    self.refresh
  end

  def refresh
    self.build_index
  end

  def build_index
    inverted_index = Hash.new { |hash, key| hash[key] = Array.new }

    @raw_data.each_with_index do |item, index|
      @property_list.each do |prop|
        inverted_index[item.send(prop)] << index
      end
    end

    inverted_index
  end

  def process_item(item, index)
    sub_index = {}

    @property_list.each do |prop|
      sub_index[item.send(prop)] = index
    end
  end

  def build_raw_match_sets(values)
    matches = []

    @inverted_index.each do |key,value|
      if values.include?(key)
        matches << value
      end
    end

    matches
  end

  def properties
    @property_list
  end

  def items
    @raw_data
  end

  def mappings
    @inverted_index
  end

  def process_matches(matches)
    matches.inject(:&)
  end

  def find(options={})
    find_all(options).first
  end

  def find_all(options={})
    raw_matches = build_raw_match_sets(options.values)
    matches = process_matches(raw_matches)

    matches.map { |match| @raw_data[match] }
  end

end
