# linkml-poetry-gp-template
A template for LinkML projects using poetry and gen-project

requires poetry as a system dependency

https://python-poetry.org/docs/#installation

once the poetry application is installed and the repo is cloned, run this once: `poerty install` to get the python dependencies

put your LinkML YAML file(s) in `model/`, set the `schema` variable in the Makefile to the **name** of your LinkML YAML file (or the top-lvevel file if there are several)

`make all`

you will get a project directory with derived artifacts

more on docuemntation later
