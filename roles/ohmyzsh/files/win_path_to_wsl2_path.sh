#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./win_path_to_wsl2_path.sh windows_path

Converts a windows-style path to a valid WSL2 path, e.g. "C:\Users\foo\bar\baz with space" will become "/mnt/c/Users/foo/bar/baz\ with\ space".

Will only work for paths on drive C:
'
    exit
fi

cd "$(dirname "$0")"

main() {
    # $1 windows-style path argument
    echo -E $1 | sed -e 's/C:/\/mnt\/c/' -e 's/\\/\//g' -e 's/ /\\ /g'
}

main "$@"