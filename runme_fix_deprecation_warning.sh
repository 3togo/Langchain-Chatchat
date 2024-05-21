#!/bin/bash

# Recursively find all files in the directory and its subdirectories
# and replace the text using sed
[[ -z "$VIRTUAL_ENV" ]] && echo "VIRTUAL_ENV is not set" && exit 1

# directory="$VIRTUAL_ENV"
find "$VIRTUAL_ENV" -name module_import.py -type f -print0 | while IFS= read -r -d '' file; do
# find "$directory" -type f -print0 | while IFS= read -r -d '' file; do
    echo $file
    sed -i 's/langchain\.document_loaders/langchain_community\.document_loaders/g' "$file"
done


