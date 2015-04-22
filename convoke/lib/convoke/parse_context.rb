class ParseContext
  attr_reader :key, :rows, :columns

  def initialize(attributes={})
    @key = attributes[:key]
    @rows = attributes[:rows]
    @columns = attributes[:columns]
  end

  def set_rows(rows)
    @rows = rows
  end

  def set_columns(columns)
    @columns = columns
  end

  def set_key(key)
    @key = key
  end
end
