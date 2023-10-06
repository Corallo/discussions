#!/bin/bash
set -e

if [[ $# -lt 1 ]] ; then
  echo "Error: Unsupported number of arguments"
  echo
  echo "USAGE:"
  echo "    run.sh <ts file>"
  echo
  echo "WHERE:"
  echo "    ts file    The filename of the TypeScript file to run"
  echo

  exit 1
fi

ts_file=$1

# Set working directory to be the directory of this bash script
cd "$(dirname "$0")"

npm run build

# Replace the .ts extension with .js
js_file="${1%.ts}.js"

# Run the JavaScript file, and pass it the arguments, except for the first one,
# which is the filename of the TypeScript file
node "./dist/$js_file" "${@:2}"
