module MapColoring where
  colorStates = [ (alabama, mississippi, georgia, tennessee, florida) |
      alabama <- colors,
      mississippi <- colors,
      georgia <- colors,
      tennessee <- colors,
      florida <- colors,
      alabama /= tennessee,
      alabama /= mississippi,
      alabama /= georgia,
      alabama /= florida,
      georgia /= florida,
      georgia /= tennessee,
      mississippi /= tennessee ]
    where colors = [ "red", "green", "blue" ]

