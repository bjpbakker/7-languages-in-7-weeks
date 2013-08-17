class Grep
  attr_reader :matcher

  def initialize matcher
    @matcher = %r(#{matcher})
  end

  def match filename, printer
    File.open filename, 'r' do |file|
      file.each_line do |line|
        printer.print_match line, file.lineno if matcher.match line
      end
    end
  end
end
