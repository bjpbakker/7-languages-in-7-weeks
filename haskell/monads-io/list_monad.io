List wrap := method(value,
  self with(value)
)

List mzero := method(
  list
)

List pass := method(fun,
  self map(v, fun call(v)) mjoin
)

List mjoin := method(
  acc := list
  foreach(v, acc appendSeq(v))
  acc
)
