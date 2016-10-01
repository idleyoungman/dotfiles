#!/bin/sh

# is stow in our $PATH?
command -v stow > /dev/null || echo "install GNU stow"; exit 1

# run stow against all dirs
for dir in *; do
  if [ -d "$dir" ]; then
    stow --verbose=1 "$dir"
  fi
done
