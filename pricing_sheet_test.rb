require 'uri'
require 'roo'

file = File.new("C:/Users/94872/Desktop/domestic_repair.xlsx", "r")
xlsx = Roo::Spreadsheet.open(file)

sheet = xlsx.sheet('Domestic')

def get_model_pricing(sheet, columns, rows, model_number)
  model_number_hash = {}
  model_number_hash[model_number] = {}

  attributes_values = model_number_hash[model_number]
  rows.each do |row_number|
    columns.each do |column_letter|
      attributes_values["#{column_letter}:#{row_number}"] = sheet.cell(column_letter, row_number)
    end
  end

  model_number_hash
end

class ModelPriceCollection

  attr_reader :model_number, :rows, :columns

  def initialize(attributes={})
    @model_number = attributes[:model_number]
    @rows = attributes[:rows]
    @columns = attributes[:columns]
  end

  def set_rows(rows)
    @rows = rows
  end

  def set_columns(columns)
    @columns = columns
  end
end

model_collections = []
model_collections << ModelPriceCollection.new(:model_number => 'TA-18', :rows =>  [*(11..16), *(27..30)].flatten, :columns => ['A', 'B', 'E'])
model_collections << ModelPriceCollection.new(:model_number => 'TA-28', :rows =>  [*(49..54), *(65..68)].flatten, :columns => ['A', 'B', 'E'])
model_collections << ModelPriceCollection.new(:model_number => 'TA-38', :rows =>  [*(88..93), *(107..109)].flatten, :columns => ['A', 'B', 'E'])
model_collections << ModelPriceCollection.new(:model_number => 'TA-48', :rows =>  [*(88..93), *(107..109)].flatten, :columns => ['A', 'B', 'E'])
model_collections << ModelPriceCollection.new(:model_number => 'TA-26', :rows =>  [*(209..216), *(230..233)].flatten, :columns => ['A', 'B', 'E'])
model_collections << ModelPriceCollection.new(:model_number => 'TA-30', :rows =>  [*(209..216), *(230..233)].flatten, :columns => ['A', 'B', 'E'])
model_collections << ModelPriceCollection.new(:model_number => 'TA-35', :rows =>  [*(209..216), *(230..233)].flatten, :columns => ['A', 'B', 'E'])

data = []

model_collections.each do |mc|
  processed_data = get_model_pricing(sheet, mc.columns, mc.rows, mc.model_number)
  data << processed_data
end

final = data.reduce({}, :merge)
puts final.inspect

puts final.keys
