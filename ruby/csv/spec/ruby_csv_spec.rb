require_relative "../lib/ruby_csv"

describe RubyCsv do
  before :each do
    File.open "rubycsv.txt", 'w' do |file|
      file << "one, two\n"
      file << "lions, tigers\n"
    end
  end

  after :each do
    File.delete "rubycsv.txt"
  end

  it "reads 'rubycsv.txt'" do
    RubyCsv.new.count.should == 1
  end

  context "row exposes values by header names" do
    it "gets value of column 'one'" do
      first_row = RubyCsv.new.first
      first_row.one.should == "lions"
    end

    it "gets value of column 'two'" do
      first_row = RubyCsv.new.first
      first_row.two.should == "tigers"
    end
  end

  context "acceptance test" do
    it "reads lions from column one" do
      values = []
      csv = RubyCsv.new
      csv.each {|row| values << row.one }
      values.should == ["lions"]
    end
  end
end
