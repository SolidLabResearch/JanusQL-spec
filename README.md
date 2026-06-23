# Janus-QL Specification

This repository contains the source files for the Janus-QL specification.

Janus-QL is a query language for expressing queries over live RDF streams and historical RDF event logs in a unified query model. The language is developed alongside Janus, which serves as a reference implementation.

## Repository structure

* `spec.bs`: main Bikeshed source file for the specification
* `README.md`: repository overview
* `CHANGELOG.md`: changes between specification versions
* `LICENSE`: license information

## Install Bikeshed

You can either [install Bikeshed locally](https://speced.github.io/bikeshed/#install-final) or 
[use a Docker image](https://speced.github.io/bikeshed/#install-docker).
You build a Docker image locally by executing the following steps:

1. Clone the [Bikeshed repository](https://github.com/speced/bikeshed) via

   ```shell
   git clone https://github.com/speced/bikeshed
   ```
   
2. In the repository, build a Docker image via

   ```shell
   docker build --tag=bikeshed:latest .
   ```

## Build

If you installed Bikeshed locally, execute `build.sh`.
If you use Docker, execute `build.docker.sh`.
You find the result in the folder `dist`.

You have to commit and push the `dist` folder and 
its content to your git repo.

If you want Bikeshed to watch for changes,
execute either `watch.sh` or `watch.docker.sh`. 
Every time you save `spec.bs` a new build is automatically triggered.

## Publish

You find an example configs in the folder `configs`:
- Use `github.json` if your repo is on GitHub.
- Use `gitlab.json` if your repo is on Gitlab.

These configs tell the Spec Platform to create a new build of the spec for every commit.
The first time the platform only creates a build for the latest commit.
You find more information about configs 
[here](https://gitlab.ilabt.imec.be/KNoWS/spec-platform/orchestrator#spec-config).
Add your updated config file with a meaningful name to 
[this folder](https://gitlab.ilabt.imec.be/KNoWS/spec-platform/pipeline/-/tree/main/configs?ref_type=heads)
via a merge request.

## Status

This specification is currently under development.

## Related work

Janus-QL builds on ideas from RDF, SPARQL, RDF Stream Processing, and historical RDF event log querying.
