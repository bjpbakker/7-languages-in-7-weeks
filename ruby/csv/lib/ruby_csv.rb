require_relative "csv_reader"

class RubyCsv
  include CsvReader
  acts_as_csv
end
