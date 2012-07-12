LATEX=pdflatex
DIST=slides.pdf handout.pdf
DEPS=presentation.tex header.tex

.PHONY: clean dist-clean all pdf

all: pdf

pdf: $(DIST)

%.pdf: $(DEPS) %.tex %.aux
	$(LATEX) $*.tex -o $*.pdf

%.aux: $(DEPS) %.tex
	$(LATEX) $*.tex -o $*.pdf

clean:
	rm -f *.log *.nav *.toc *.aux *.snm *.out

dist-clean: clean
	rm -f $(DIST)
