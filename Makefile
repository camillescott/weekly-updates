MD=$(wildcard *.md)
PDF=$(patsubst %.md, %.pdf, $(MD))

all: $(PDF)

%.pdf: %.md Makefile latex.tpl
	pandoc -r markdown+yaml_metadata_block+startnum+fancy_lists -V geometry:margin=1in --template latex.tpl  $(patsubst %.pdf, %.md, $@) -o $@

clean:
	rm -rf *.pdf
