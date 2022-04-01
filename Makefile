## CHANGE THIS
SCHEMA_NAME = my_datamodel

RUN = poetry run
SRC = src
SCHEMA_DIR = $(SRC)/linkml
SCHEMA_ROOT = $(SCHEMA_DIR)/$(SCHEMA_NAME).yaml
DEST = project
PYMODEL = $(SRC)/$(SCHEMA_NAME)/datamodel

# basename of a YAML file in model/
.PHONY: all clean

all: gen-project
%.yaml: gen-project
deploy: all mkd-gh-deploy

# generates all project files
gen-project: $(PYMODEL)
	$(RUN) gen-project -d $(DEST) $(SCHEMA_ROOT) && mv $(DEST)/*.py $(PYMODEL)

test: 
	$(RUN) gen-project -d tmp $(SCHEMA_ROOT) 

# Test documentation locally
serve: mkd-serve

# Python datamodel
$(PYMODEL):
	mkdir -p $@

gendoc:
	$(RUN) gen-doc -d docs $(SCHEMA_ROOT)

MKDOCS = $(RUN) mkdocs
mkd-%:
	$(MKDOCS) $*


clean:
	rm -rf $(DEST)
	rm -rf tmp

include project.Makefile
