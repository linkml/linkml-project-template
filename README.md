# LinkML Project Template

_A template for LinkML projects_

NOTE: You don't need to directly use this repository directly!

Instead:

 * [install poetry](https://python-poetry.org/docs/)
 * [install linkml](https://linkml.io/linkml/intro/install.html)
 * run `linkml-ws new`

## Example:


```
mkdir ~/my-projects
cd ~/my-projects
pip install linkml
linkml-ws new my-project-name
cd my-project-name
# edit src/linkml/my-project-name
make setup
```

Type `make` to see a full list of options.

Then you will be encouraged to run
```shell
cd my-project-name
make setup
```

## Getting it into GitHub

- Create a new repo but don't allow GH to initialize any files for you: no README, no .gitignore, no license, etc. Just give it a `Repository name` and click `Create repository`
- set your origin, based on your GH org or user name and your new repo's name
  - `git remote add origin git@github.com:<USER/ORG>/<REPO NAME>.git`
- push!
  - `git push -u origin main`


## Alternative protocol

You can also simply clone this repo and use it as a template, modifying files as you need - however,
this is no longer the recommended path


