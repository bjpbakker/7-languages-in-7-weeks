XmlBuilder := Object clone do (
  init := method(
    newSlot("depth", Depth clone)
  )

  forward := method(
    tagName := call message name
    arguments := call message arguments
    depth inc

    xml := Sequence clone
    xml appendSeq(depth newLineIfNested .. depth indent("  "))
    tag := Tag with(tagName)
    if (arguments isNotEmpty) then (
      tag setAttributes(popAttributes(arguments))
      tag setBody(
        arguments map(arg, self doMessage(arg)) join replaceSeq("\n\n", "\n")
      )
    )
    xml appendSeq(tag asXml)
    xml appendSeq(depth newLineIfNested)

    depth dec
    xml
  )

  popAttributes := method(arguments,
    attrs := Map clone
    candidate := self doMessage(arguments first)
    if (candidate isKindOf(Map)) then (
      arguments removeFirst
      attrs := candidate
    )
    attrs
  )
)

Tag := Object clone do (
  with := method(name,
    self clone setName(name)
  )

  asXml := method(
    openTag(attrs) .. tagBody .. closeTag
  )

  attrs := method(
    attributes map(key, value,
      " " .. key .. "='" .. value .. "'"
    ) join
  )

  openTag := method(attrs,
    "<" .. name .. attrs .. if (body, ">", "")
  )

  tagBody := method(
    if (body, body, "")
  )

  closeTag := method(
    if (body, "</" .. name .. ">", " />")
  )

  init := method(
    newSlot("name")
    newSlot("attributes", Map clone)
    newSlot("body")
  )
)

Depth := Object clone do (
  init := method(
    newSlot("value", 0)
  )

  inc := method(
    value = value + 1
    self
  )

  dec := method(
    value = value - 1
    self
  )

  indent := method(prefix,
    indentation := Sequence clone
    (value - 1) repeat (indentation appendSeq(prefix))
    indentation
  )

  newLineIfNested := method(
    if (value > 1,
      "\n",
      "")
  )
)
