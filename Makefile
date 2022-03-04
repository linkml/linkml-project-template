# basename of a YAML file in model/
.PHONY: all clean

clean:
	rm -rf project
	rm -rf tmp


%.yaml: clean
	poetry run gen-project -d project model/$@
