# linkml-poetry-gp-template
_A template for LinkML projects using poetry and gen-project_

This repo requires poetry as a system dependency

https://python-poetry.org/docs/#installation

Once the poetry application is installed and the repo is cloned, run this once: `poerty install` to get the python dependencies

Put your LinkML YAML file(s) in `model/`

Finally, use the `make project/%.py` rule to generate artifacts based on the LinkML model. Replace the `%` with the basename oif your primary LinkML file, without the `.yaml` extension. In the case of the provided `model/kitchen_sink.yaml`, you would enter

`make project/kitchen_sink.py`

you will get a project directory with derived artifacts, including the python classes

more on documentation later
