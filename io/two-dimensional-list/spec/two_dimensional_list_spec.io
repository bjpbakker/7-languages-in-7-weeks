doRelativeFile("../src/two_dimensional_list.io")

describe (TwoDimensionalList) do (
  it ("defines a two-dimensional list") do (
    subject dim(2, 4)
    subject xs should == 2
    subject ys should == 4
  )

  it ("sets and gets single cell") do (
    subject dim(3,3)
    subject set(0, 0, "value")
    subject get(0, 0) should == "value"
  )

  it ("transposes the matrix") do (
    subject dim(2, 3)
    subject set(1, 2, "transposed")
    subject transpose get(2, 1) should == "transposed"
  )

  it ("reads list from file") do (
    lines := list(
      list setSize(2),
      list setSize(2),
      list setSize(2)
    )
    MatrixSerializer clone setPath("/tmp/matrix.dat") write(lines)

    subject fromFile("/tmp/matrix.dat")
    subject xs should == 2
    subject ys should == 3
  )

  it ("restores value from file") do (
    lines := list( list("<value>") )
    MatrixSerializer clone setPath("/tmp/matrix.dat") write(lines)
    subject fromFile("/tmp/matrix.dat")
    subject get(0, 0) should == "<value>"
  )

  it ("restores nil value from file") do (
    lines := list( list(nil) )
    MatrixSerializer clone setPath("/tmp/matrix.dat") write(lines)

    subject fromFile("/tmp/matrix.dat")
    subject get(0, 0) should == nil
  )

  it ("writes list to file") do (
    subject dim(1, 1)
    subject set(0, 0, "<value>")
    subject toFile("/tmp/matrix.dat")

    serialized := MatrixSerializer clone setPath("/tmp/matrix.dat") read
    serialized should == list( list("<value>") )
  )
)
