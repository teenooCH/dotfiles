#!/bin/bash
# Setup Atom editor
set -euf -o pipefail

AtomHome="${HOME}/.atom/"
AtomPackages="packages.txt"

if [ ! -d "${AtomHome}" ]; then
  mkdir ${AtomHome}
fi
cp ./config.cson ${AtomHome}
cp ./keymap.cson ${AtomHome}
cp ./styles.less ${AtomHome}

while read -r pkg; do
  apm install ${pkg}
done <${AtomPackages}
