require 'uri'
require 'roo'


require_relative './config'
require_relative './lib/convoke/parse_context'
require_relative './lib/convoke/excel_parser'
require_relative './lib/convoke/transformer'


file = File.new("C:/Users/94872/Desktop/domestic_repair.xlsx", "r")
xlsx = Roo::Spreadsheet.open(file)
sheet = xlsx.sheet('Domestic')

parser = Convoke::ExcelParser.new(sheet, Configuration::default_parse_contexts)

result = parser.parse

# result.each do |key,value|
  # puts "#{key}"
  # value.each do |hash|
    # puts hash.inspect
  # end
# end

transformer = Convoke::Transformer.new(part_number: 'A', description: 'B', list_price: 'E')
transformer.map 'part_number', 'A'
transformer.map 'description', 'B'
transformer.map 'list_price', 'E'

transformed_results = transformer.transform(result)

transformed_results.each do |result|
  puts result
end
