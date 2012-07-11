LATEX=pdflatex
DIST=slides.pdf handout.pdf
DEPS=presentation.tex header.tex git-users.png

.PHONY: clean dist-clean

all: pdf

pdf: $(DIST)

%.pdf: $(DEPS) %.tex
	$(LATEX) $*.tex -o $*.pdf

git-users.png: git-users.gv logos/*.png
	neato -Tpng -o $@ $<

clean:
	rm -f *.log *.nav *.toc *.aux *.snm *.out git-users.png

dist-clean: clean
	rm -f $(DIST)
