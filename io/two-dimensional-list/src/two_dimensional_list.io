TwoDimensionalList := Object clone do (
  init := method(
    newSlot("matrix")
  )

  dim := method(xs, ys,
    grid := list setSize(ys)
    ys repeat (index,
      grid atPut(index, list setSize(xs))
    )
    self setMatrix(grid)
    self
  )

  fromFile := method(path,
    setMatrix(
      MatrixSerializer clone setPath(path) read
    )
    self
  )

  toFile := method(path,
    MatrixSerializer clone setPath(path) write(matrix)
    self
  )

  xs := method(
    matrix at(0) size
  )

  ys := method(
    matrix size
  )

  get := method(x, y,
    matrix at(y) at(x)
  )

  set := method(x, y, value,
    matrix at(y) atPut(x, value)
    self
  )

  transpose := method(
    transposed := self clone dim(ys, xs)
    ys repeat(y,
      xs repeat(x,
        transposed set(y, x, get(x, y))
      )
    )
    transposed
  )
)

MatrixSerializer := Object clone do (
  init := method(
    newSlot("path")
  )

  read := method(
    file := File clone openForReading(path)
    lines := file readLines
    file close
    matrix := list setSize(lines size)
    lines size repeat(index,
      matrix atPut(index, unescape(lines at(index) split(",")))
    )
  )

  write := method(matrix,
    data := matrix map(row, escape(row)) map(join(",")) join("\n")
    File clone openForUpdating(path) setContents(data) close
  )

  escape := method(values,
    values map(asString) map(asMutable escape) \
           map(value, quote .. value .. quote)
  )

  unescape := method(values,
    values map(removePrefix(quote) removeSuffix(quote) unescape) \
           map(value, if (value == "nil", nil, value))
  )

  quote := "\""
)
