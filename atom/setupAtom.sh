#!/bin/bash
# Setup Atom editor
set -euf -o pipefail

AtomHome="/home/${1}/.atom/"
AtomPackages="packages.txt"

if [ ! -d "${AtomHome}" ]; then
  mkdir ${AtomHome}
  chmod 0750 ${1} ${AtomHome}
  chown ${1}:${1} ${AtomHome}
fi
cp ./config.cson ${AtomHome}
cp ./keymap.cson ${AtomHome}
cp ./styles.less ${AtomHome}

while read -r pkg; do
  apm install ${pkg}
done <${AtomPackages}
