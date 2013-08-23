# 
# Spec file that loads up the DSL and kicks of the actual
# specs for XML builder.
# 
# The Io interpreter requires operator definitions to be loaded
# before the file that uses them. Loading them from the file 
# itself does not work, hence this spec runner.
#
doRelativeFile("../src/curly_map.io")
doRelativeFile("../src/xml_builder.io")

doRelativeFile("specs.io")

