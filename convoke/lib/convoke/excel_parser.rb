module Convoke
  class ExcelParser

    # Initialize a new ExcelParser
    #
    # @param file_path [String] - The path to the Excel file to parse
    # @param contexts [Array<LookupContext>] - The information needed to find
    # the information within an excel file.
    def initialize(sheet, contexts)
      @sheet = sheet
      @contexts = contexts

    end

    # Takes the array of LookupContext's provided in the initialize method,
    # and parses the information for each context, and returns a merged
    # hash. 
    def parse
      results = []

      @contexts.each do |context|
        results << parse_context(context)
      end

      results.reduce({}, :merge)
    end

    # Takes a column_letter, row_number and creates a hash of the values
    # taken from the given cell(column, row) in the Excel sheet.
    def parse_cell(column, row)
      result_hash = {}
      result_hash["#{column}:#{row}"] = @sheet.cell(column, row)

      result_hash
    end

    # Given a row number, and an array of columns, returns a merged hash
    # containing values for each cell parsed in the row.
    def parse_row(row, columns)
      results = []

      columns.each do |column_letter|
        results << parse_cell(column_letter, row)
      end

      results.reduce({}, :merge)
    end

    # Given an array of rows, and columns, returns an array of hashes
    # with each hash representing the values for a single row.
    def parse_rows(rows, columns)
      results = []

      rows.each do |row_number|
        results << parse_row(row_number, columns)
      end

      results
    end

    def parse_context(context)
      results_hash = {}
      results_hash[context.key] = parse_rows(context.rows, context.columns)

      results_hash
    end
  end
end
