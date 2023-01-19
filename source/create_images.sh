#!/bin/bash

set -e -o pipefail

print_help() {
  echo "Script usage: $(basename "$0") [-r] <acr_registry_name|acr_registry_login_server>" >&2
}

handle_input() {
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
}

acr_login() {
  registry="$1"

  az acr login -n "$registry"
}

build_image() {
  tag="$1"
  path="$2"

  docker build -t "$tag" "$path"
}

push_image() {
  tag="$1"

  docker push "$tag"
}

build_images() {
  find . -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | while read -r service; do
    build_image "$REGISTRY.azurecr.io/$service" "$service"
    push_image "$REGISTRY.azurecr.io/$service"
  done
}

handle_input "$@"

echo "Authetication with azure container registry '$REGISTRY' ..."
acr_login "$REGISTRY"

echo "Building images..."
build_images
