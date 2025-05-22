#!/usr/bin/env bash
set -euo pipefail

echo "# 🛠 Dotfiles Tool Index"
echo
echo "Auto-generated list of CLI tools in \`bin/\` by running each script."

for script in ./bin/*; do
  [[ -x "$script" && -f "$script" ]] || continue
  name=$(basename "$script")

  echo
  echo "## \`$name\`"
  echo

  "$script" 2>&1 || true
done
