.PHONY: clean
IN = main
FILES = $(IN).aux $(IN).log $(IN).out $(IN).synctex.gz $(IN).toc $(IN).bbl $(IN).blg $(IN).lof
CXX = pdflatex

all: $(IN).pdf

$(IN).pdf: $(IN).tex
	$(CXX) $<
	bibtex $(IN).aux
	$(CXX) $<
	$(CXX) $<

clean:
	@echo Limpiando archivos extra generados por LaTex...
	rm -f $(FILES)

full-clean:
	@echo Limpiando todos los archivos generados por LaTex...
	rm -f $(FILES) $(IN).pdf
