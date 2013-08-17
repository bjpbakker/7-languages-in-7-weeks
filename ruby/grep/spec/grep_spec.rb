require 'tempfile'

require_relative "../lib/grep"

describe Grep do
  let(:datafile) { 
    Tempfile.open "grep" do |file|
      file << "line-one\n"
      file << "line-two\n"
    end.path
  }
  let(:printer) { double(:printer) }

  it "prints one matching line" do
    printer.should_receive(:print_match).with "line-one\n", 1
    grep = Grep.new "^line-one$"
    grep.match datafile, printer
  end

  it "prints multipe matching lines" do
    printer.should_receive(:print_match).with "line-one\n", 1
    printer.should_receive(:print_match).with "line-two\n", 2
    grep = Grep.new ".*"
    grep.match datafile, printer
  end

  it "prints nothing as no line matches" do
    printer.should_not_receive(:print_match)
    grep = Grep.new "^$"
    grep.match datafile, printer
  end
end
