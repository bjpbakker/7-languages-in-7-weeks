describe (XmlBuilder) do (
  it ("writes empty tag") do (
    xml := subject br
    xml should == "<br />"
  )

  it ("writes single tag") do (
    xml := subject span("text")
    xml should == "<span>text</span>"
  )

  it ("indents nested tag") do (
    xml := subject p(br)
    xml should == "<p>\n  <br />\n</p>"
  )

  it ("writes multiple nested tags") do (
    xml := subject ul(li("Io"), li("Lua"), li("JavaScript"))
    xml should == "<ul>\n  <li>Io</li>\n  <li>Lua</li>\n  <li>JavaScript</li>\n</ul>"
  )

  it ("writes attributes to tag") do (
    xml := subject p({"class": "content"}, "text")
    xml should == "<p class='content'>text</p>"
  )
)
