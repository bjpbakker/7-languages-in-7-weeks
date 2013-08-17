class TerminalPrinter
  attr_reader :filename

  def initialize filename
    @filename = filename
  end

  def print_match line, lineno
    puts "#{filename}:#{lineno}:#{line}"
  end
end
