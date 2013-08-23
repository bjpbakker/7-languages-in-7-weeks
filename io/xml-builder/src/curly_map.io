OperatorTable addAssignOperator(":", "atPutValue")
curlyBrackets := method(
  CurlyMap with(call message arguments)
)

CurlyMap := Map clone do (
  with := method(args,
    m := self clone
    args foreach(arg,
      m doMessage(arg)
    )
    m
  )

  atPutValue := method(
    key := unquote(call evalArgAt(0) asMutable)
    value := call evalArgAt(1)
    self atPut(key, value)
  )

  unquote := method(seq,
    seq removePrefix("\"") removeSuffix("\"")
  )

  asString := method(
    str := Sequence with("{ \n")
    foreach(key, value,
      str appendSeq(key .. ": " .. value .. "\n")
    )
    str appendSeq("}")
    str
  )
)
