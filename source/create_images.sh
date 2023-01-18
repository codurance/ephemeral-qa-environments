#!/bin/bash

set -e -o pipefail

readonly SCRIPT_DIR="$(dirname "$0")"

print_help() {
  echo "Script usage: $(basename "$0") [-r] <acr_registry_name|acr_registry_login_server>" >&2
}

if [ $# = 0 ]; then
  print_help
  exit 1
fi

while getopts 'r:' OPTION; do
  case "$OPTION" in
  r)
    REGISTRY="${OPTARG%'.azurecr.io'}"
    if [ -z "$REGISTRY" ]; then
      print_help
      exit 1
    fi
    ;;
  *)
    print_help
    exit 1
    ;;
  esac
done

acr_login() {
  registry="$1"

  az acr login -n "$registry"
}

build_image() {
  tag="$1"
  path="$2"

  docker build -t "$tag" "$path"
  docker push "$tag"
  docker rmi "$tag"
}

echo "Authetication with azure container registry '$REGISTRY' ..."
acr_login "$REGISTRY"

echo "Building images..."
for image in $(find . -mindepth 1 -maxdepth 1 -type d | grep -v jenkins | sed 's/\.\///'); do
  echo "$image"
  build_image "$REGISTRY.azurecr.io/$image" "$(dirname "$0")/$image"
done
