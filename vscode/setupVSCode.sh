#!/bin/bash
# Setup VS Code editor
set -euf -o pipefail

VscHome="${HOME}/.config/Code"
VscUserCfgDir="${VscHome}/User"
VscPackages="extensions.txt"

if [ ! -d "${VscUserCfgDir}" ]; then
  mkdir -p ${VscUserCfgDir}
fi
cp ./settings.json ${VscUserCfgDir}

while read -r pkg; do
  code --install-extension ${pkg}
done <${VscPackages}
