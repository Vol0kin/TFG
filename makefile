.PHONY: clean full-clean

# Information associated to the Thesis
MAIN = main.tex
MEMORIA = memoriaTFG
DIR_MEMORIA = dirMemoria

# Information associated to the User's Manual
MANUAL = extra/user_manual.tex
MANUAL_USUARIO = manual_usuario
DIR_MANUAL = dirManual

# PDF generator and bibliography manager
CXX = pdflatex
BIB = biber


all: $(MEMORIA) $(MANUAL_USUARIO)

$(MEMORIA): $(MEMORIA).pdf

$(MANUAL_USUARIO): $(MANUAL_USUARIO).pdf

################################################################################
# Generate Thesis
$(MEMORIA).pdf: $(DIR_MEMORIA) $(MAIN)
	$(CXX) -output-directory=$(DIR_MEMORIA) -jobname=$(MEMORIA) $(MAIN)
	$(BIB) $(DIR_MEMORIA)/$(MEMORIA).bcf
	$(CXX) -output-directory=$(DIR_MEMORIA) -jobname=$(MEMORIA) $(MAIN)
	$(CXX) -output-directory=$(DIR_MEMORIA) -jobname=$(MEMORIA) $(MAIN)
	cp $(DIR_MEMORIA)/$(MEMORIA).pdf .

$(DIR_MEMORIA):
	mkdir $@

################################################################################
# Generate User's Manual
$(MANUAL_USUARIO).pdf: $(DIR_MANUAL) $(MANUAL)
	$(CXX) -output-directory=$(DIR_MANUAL) -jobname=$(MANUAL_USUARIO) $(MANUAL)
	$(CXX) -output-directory=$(DIR_MANUAL) -jobname=$(MANUAL_USUARIO) $(MANUAL)
	cp $(DIR_MANUAL)/$(MANUAL_USUARIO).pdf .


$(DIR_MANUAL):
	mkdir $@


################################################################################
# Remove files
clean:
	@echo Limpiando archivos extra generados por LaTex...
	rm -rf $(DIR_MEMORIA) $(DIR_MANUAL)

full-clean: clean
	@echo Limpiando archivos PDF...
	rm -f *.pdf

