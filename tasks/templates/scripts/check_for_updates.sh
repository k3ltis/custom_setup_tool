#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

cd "$(dirname "$0")"

main() {
    brew_upgrades_available="$(brew upgrade --dry-run | egrep "Would install|Would upgrade" | wc --lines)"
    if [[ brew_upgrades_available -gt 0 ]]; then
        printf "There are homebrew upgrades available\n"
    fi
    apt_get_upgrades_available="$(apt-get upgrade --dry-run | egrep "[1-9][0-9]* upgraded|[1-9][0-9]* newly installed|[1-9][0-9]* to remove" | wc --lines)"
    if [[ apt_get_upgrades_available -gt 0 ]]; then
        printf "There are apt-get upgrades available\n"
    fi
}
main "$@"