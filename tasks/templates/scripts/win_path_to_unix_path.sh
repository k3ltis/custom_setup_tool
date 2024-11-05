#!/usr/bin/env bash

set -o errexit # Makes script fail on error
set -o nounset # Makes script fail on accessing unset variable
set -o pipefail # Makes pipeline commands fail if at least one command in the pipeline failes
if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi # Helps debugging the script using `TRACE=1 ./script.sh`

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

cd "$(dirname "$0")"

main() {
    echo -E $1 | sed -e 's/C:/\/mnt\/c/' -e 's/\\/\//g' -e 's/ /\\ /g'
}

main "$@"
