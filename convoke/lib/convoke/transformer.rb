module Convoke
  class Transformer

    attr_reader :property_map

    def initialize(property_map={})
      @property_map = property_map
    end

    # Map a property name to a column_letter.
    def map(property_name, column_letter)
      @property_map[column_letter] = property_name
    end

    def decode_parse_tree_key(key)
      split_key = key.split(':')
      return split_key
    end

    def get_column_letter(key)
      decode_parse_tree_key(key)[0]
    end

    def get_row_number(parse_tree_key)
      decode_parse_tree_key(key)[1]
    end

    def transform_row(value_hash)
      result = {}

      value_hash.each do |key, value|
        column_letter = get_column_letter(key)
        column_property = @property_map[column_letter]

        result[column_property.to_sym] = value
      end

      return result
    end

    # Rows = An array of value hashes
    def transform_rows(rows)
      results = []

      rows.each do |row|
        results << transform_row(row)
      end

      results.flatten
    end

    def transform(parse_tree)
      results = []
      parse_tree.each do |key,value|
        results << transform_rows(value)
      end

      results.flatten
    end


  end
end
