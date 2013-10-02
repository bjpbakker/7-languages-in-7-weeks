class Array
  def self.wrap value
    [value]
  end

  def self.mzero
    []
  end

  def pass (&block)
    map(&block).mjoin
  end

  def mjoin
    inject [] { |acc, value| acc + value }
  end
end
