## CHANGE THIS
SCHEMA_NAME = my_datamodel

RUN = poetry run
SRC = src
SCHEMA_DIR = $(SRC)/linkml
SCHEMA_ROOT = $(SCHEMA_DIR)/$(SCHEMA_NAME).yaml
DEST = project
PYMODEL = $(SRC)/$(SCHEMA_NAME)/datamodel
DOCDIR = docs

# basename of a YAML file in model/
.PHONY: all clean

help:
	@echo "make all -- makes site locally"
	@echo "make deploy -- deploys site"
	@echo "make help -- this"
	@echo ""
all: gen-project gendoc
%.yaml: gen-project
deploy: all mkd-gh-deploy

# generates all project files
gen-project: $(PYMODEL)
	$(RUN) gen-project -d $(DEST) $(SCHEMA_ROOT) && mv $(DEST)/*.py $(PYMODEL)

test: 
	$(RUN) gen-project -d tmp $(SCHEMA_ROOT) 

upgrade:
	poetry add -D linkml@latest

# Test documentation locally
serve: mkd-serve

# Python datamodel
$(PYMODEL):
	mkdir -p $@


$(DOCDIR):
	mkdir -p $@

gendoc: $(DOCDIR)
	cp $(SRC)/docs/*md $(DOCDIR) ; \
	$(RUN) gen-doc -d $(DOCDIR) $(SCHEMA_ROOT)

MKDOCS = $(RUN) mkdocs
mkd-%:
	$(MKDOCS) $*


clean:
	rm -rf $(DEST)
	rm -rf tmp

include project.Makefile
