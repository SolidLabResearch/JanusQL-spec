./pre.sh
docker run --rm -v $(pwd):/data bikeshed:latest bikeshed spec /data/spec-src/spec.bs /data/dist/index.html
