#!/bin/bash
# Setup Atom editor
set -euf -o pipefail

AtomHome="${1}/.atom/"
AtomPackages="packages.txt"

if [ -d "${AtomHome}" ]; then
  cp ./config.cson ${AtomHome}
  cp ./keymap.cson ${AtomHome}
  cp ./styles.less ${AtomHome}
fi

while read -r pkg; do
  apm install ${pkg}
done <${AtomPackages}
