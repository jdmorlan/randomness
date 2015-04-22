require 'ostruct'

properties = [:first_name, :last_name]
person = OpenStruct.new(:id => 1, :first_name => 'Jay', :last_name => 'Morlan')

def tokenize(tokenizer)
  properties.each do |p|
    tokenizer.tokenize(item)
  end
end

def build_index(items, properties)
  index = Hash.new { |hash, key| hash[key] = Array.new }

  items.each do |i|
    result = tokenize(i, properties)
    result[1].each do |t|
      index[t] << i.id
    end
  end

  index
end


index = build_index([person], properties)
puts index.inspect

class Tokenizer

  def tokenize(item, properties)
    tokens = properties.map { |x| item.send(x) }
    [item.id, tokens]
  end

end
