.PHONY: clean full-clean

# Information associated to the Thesis
MAIN = main.tex
MEMORIA = memoriaTFG
DIR_MEMORIA = dirMemoria

# Information associated to the User's Manual
MANUAL = extra/user_manual.tex
MANUAL_USUARIO = manual_usuario
DIR_MANUAL = dirManual

# Information associated to the presentation
PRESENTATION_FILE = presentation/presentation.tex
PRESENTATION = presentation
DIR_PRESENTATION = dirPresentation

DIRS = $(DIR_MEMORIA) $(DIR_MANUAL) $(DIR_PRESENTATION)

# PDF generator and bibliography manager
CXX = pdflatex
BIB = biber

# Shell
SHELL=/bin/zsh

all: $(MEMORIA) $(MANUAL_USUARIO) $(PRESENTATION)

$(MEMORIA): $(MEMORIA).pdf

$(MANUAL_USUARIO): $(MANUAL_USUARIO).pdf

$(PRESENTATION): $(PRESENTATION).pdf

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
# Generate Presentation
$(PRESENTATION).pdf: $(DIR_PRESENTATION) $(PRESENTATION_FILE)
	$(CXX) -output-directory=$(DIR_PRESENTATION) -jobname=$(PRESENTATION) $(PRESENTATION_FILE)
	$(CXX) -output-directory=$(DIR_PRESENTATION) -jobname=$(PRESENTATION) $(PRESENTATION_FILE)
	cp $(DIR_PRESENTATION)/$(PRESENTATION).pdf .

$(DIR_PRESENTATION):
	mkdir $(DIR_PRESENTATION)


################################################################################
# Watch updates on presentation
watch-presentation:
	@while true; do; inotifywait $(PRESENTATION_FILE); sleep 0.01; make presentation; done

################################################################################
# Remove files
clean:
	@echo Limpiando archivos extra generados por LaTex...
	rm -rf $(DIRS)

full-clean: clean
	@echo Limpiando archivos PDF...
	rm -f *.pdf

