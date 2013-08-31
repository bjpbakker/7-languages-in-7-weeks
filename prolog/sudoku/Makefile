TARGET = build

GPLC = gplc -c -o $(TARGET)/%P.o
LINK = gplc --min-size

all: spec

spec: compile test-compile
	$(LINK) -o $(TARGET)/test \
    $(TARGET)/test.o \
		$(TARGET)/util.o $(TARGET)/util_test.o
	$(TARGET)/test

compile: check-structure util sudoku

test-compile: test util_test

clean:
	rm -rf $(TARGET)

.PHONY: all compile test-compile spec clean check-structure

test:
	$(GPLC) test.pl

sudoku:
	$(GPLC) sudoku.pl

sudoku_test:
	$(GPLC) sudoku_test.pl

util:
	$(GPLC) util.pl

util_test:
	$(GPLC) util_test.pl

check-structure:
	-@mkdir -p $(TARGET)
