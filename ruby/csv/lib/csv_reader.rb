module CsvReader
  def self.included target
    target.extend CsvClass
  end

  module CsvClass
    def acts_as_csv
      include CsvInstance
    end
  end

  module CsvInstance
    include Enumerable

    def initialize
      csv_file = self.class.to_s.downcase + '.txt'
      File.open csv_file, 'r' do |file|
        @headers = parse_fields file.gets.chomp
        @rows = file.each_line.map { |line| parse_fields line.chomp }
      end
    end

    def parse_fields line
      line.split /, */
    end

    def each
      @rows.each do |row|
        fields = Hash[@headers.zip(row)]
        yield Row.new fields
      end
    end

    class Row
      attr_reader :fields

      def initialize fields
        @fields = fields
      end

      def method_missing name, *args
        @fields.fetch(name.to_s)
      end
    end
  end
end
