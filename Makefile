# basename of a YAML file in model/
schema=kitchen_sink

.PHONY: all clean

clean:
	rm -rf project
	rm -rf tmp

project/%.py: clean
	#echo $(schema)
	poetry run gen-project -d project model/$(schema).yaml

