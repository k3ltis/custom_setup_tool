#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./win_path_to_unix_path.sh windows_path

Converts a windows-style path to unix-based path. For example
"C:\Users\foo\bar\baz with space" --> "/mnt/c/Users/foo/bar/baz\ with\ space"

'
    exit
fi

cd "$(dirname "$0")"

main() {
    # $1 windows-style path argument
    echo -E $1 | sed -e 's/C:/\/mnt\/c/' -e 's/\\/\//g' -e 's/ /\\ /g'
}

main "$@"