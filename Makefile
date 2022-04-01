RUN = poetry run
SCHEMA_NAME = my_datamodel ## CHANGE THIS
SRC = src
SCHEMA_DIR = $(SRC)/linkml/
SCHEMA_ROOT = $(SCHEMA_DIR)/$(SCHEMA_NAME).yaml
DEST = project

# basename of a YAML file in model/
.PHONY: all clean

all: gen-project
%.yaml: gen-project
deploy: all mkd-gh-deploy

gen-project:
	$(RUN) gen-project -d $(DEST) $(SCHEMA_ROOT) && mv $(DEST)/*.py $(SRC)/$(SCHEMA_NAME)/datamodel/

gendoc:
	$(RUN) gen-doc -d docs $(SCHEMA_ROOT)

MKDOCS = $(RUN) mkdocs
mkd-%:
	$(MKDOCS) $*


clean:
	rm -rf $(DEST)
	rm -rf tmp

