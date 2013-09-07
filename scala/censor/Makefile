SHELL := /bin/bash

PROGRAM=censor
CLASSPATH=$(shell echo $(wildcard lib/*.jar) | sed -e 's/ /:/g')

all: jar spec
jar: dist/$(PROGRAM).jar
spec: build/.specs-pass

.PHONY: all jar spec

# find files in directory with suffix (call find,dir,ext)
find = $(shell find $(1) -name '*.$(2)')

# compile core jar
dist/$(PROGRAM).jar: $(call find,src,scala)
	@mkdir -p build/main/classes
	@mkdir -p dist
	scalac -encoding UTF-8 -g:vars -classpath $(CLASSPATH) -d build/main/classes $(call find,src,scala)
	jar cf $@ -C build/main/classes .

# compile specs jar
build/$(PROGRAM)-specs.jar: dist/$(PROGRAM).jar $(call find,spec,scala)
	@mkdir -p build/spec/classes
	scalac -encoding UTF-8 -g:vars -classpath $(CLASSPATH):dist/$(PROGRAM).jar -d build/spec/classes $(call find,spec,scala)
	jar cf $@ -C build/spec/classes .

# create .specs-pass if all specs pass
build/.specs-pass: build/$(PROGRAM)-specs.jar
	@rm -f $@
	scala -classpath dist/$(PROGRAM).jar:build/$(PROGRAM)-specs.jar:$(CLASSPATH) org.scalatest.tools.Runner -R build/$(PROGRAM)-specs.jar -o
	@touch $@

clean:
	rm -rf build dist
.PHONY: clean

again: clean all
.PHONY: again

