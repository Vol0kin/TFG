.PHONY: clean full-clean
MAIN = main.tex
MEMORIA = memoriaTFG
DIR_MEMORIA = dirMemoria
CXX = pdflatex
BIB = biber


all: $(MEMORIA)

$(MEMORIA): $(MEMORIA).pdf

$(MEMORIA).pdf: $(DIR_MEMORIA) $(MAIN)
	$(CXX) -output-directory=$(DIR_MEMORIA) -jobname=$(MEMORIA) $(MAIN)
	$(BIB) $(DIR_MEMORIA)/$(MEMORIA).bcf
	$(CXX) -output-directory=$(DIR_MEMORIA) -jobname=$(MEMORIA) $(MAIN)
	$(CXX) -output-directory=$(DIR_MEMORIA) -jobname=$(MEMORIA) $(MAIN)
	cp $(DIR_MEMORIA)/$(MEMORIA).pdf .

$(DIR_MEMORIA):
	mkdir $@

clean:
	@echo Limpiando archivos extra generados por LaTex...
	rm -rf $(DIR_MEMORIA)

full-clean: clean
	@echo Limpiando archivos PDF...
	rm -f *.pdf
