#!/usr/bin/env bash
set -euo pipefail

./pre.sh

if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required to build this specification." >&2
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "docker daemon is not running." >&2
  exit 1
fi

render_dir="dist/.docker-render"
rm -rf "$render_dir"

docker run --rm --platform linux/amd64 -v "$PWD":/work -w /work/spec-src maartyman/bikeshed-image:latest spec.bs "/work/$render_dir"

rm -rf dist/index.html
cp "$render_dir/index.html" dist/index.html

for path in "$render_dir"/*; do
  name="$(basename "$path")"
  if [ "$name" = "index.html" ] || [ "$name" = "spec.bs" ]; then
    continue
  fi
  rm -rf "dist/$name"
  cp -R "$path" "dist/$name"
done

rm -rf "$render_dir"
