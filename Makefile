LATEX=pdflatex
DIST=slides.pdf handout.pdf
PNGS=git-users.png centralized-workflow.png distributed-workflow.png
PNGS+=snapshots.png deltas.png staging.png staging2.png
DEPS=presentation.tex header.tex $(PNGS)

.PHONY: clean dist-clean all pdf

all: pdf

pdf: $(DIST)

%.pdf: $(DEPS) %.tex %.aux
	$(LATEX) $*.tex -o $*.pdf

%.aux: $(DEPS) %.tex
	$(LATEX) $*.tex -o $*.pdf

git-users.png: git-users.gv logos/*.png
	neato -Tpng -o $@ $<

%.png: %.gv
	dot -Tpng -o $@ $<

clean:
	rm -f *.log *.nav *.toc *.aux *.snm *.out $(PNGS)

dist-clean: clean
	rm -f $(DIST)
