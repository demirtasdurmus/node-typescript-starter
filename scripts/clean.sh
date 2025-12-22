#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No color

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "${REPO_ROOT}" ]]; then
  echo -e "${RED}Error:${NC} This script must be run inside the git repository."
  exit 1
fi

cd "${REPO_ROOT}"

FORCE="${1:-}"

EXCLUDES=(
  ".cursor"
)

EXCLUDE_ARGS=()
for path in "${EXCLUDES[@]}"; do
  EXCLUDE_ARGS+=("-e" "$path")
done

echo -e "${YELLOW}Repository clean utility${NC}"
echo -e "This will remove generated artifacts (dist/, node_modules/, etc.)"

if [[ "${FORCE}" != "--force" && "${FORCE}" != "-f" ]]; then
  echo -e "\n${YELLOW}The following files/directories would be deleted:${NC}\n"
  git clean -xdn "${EXCLUDE_ARGS[@]}" | sed 's/^Would remove //'
  echo -e "\n${RED}Warning:${NC} This action is irreversible.\n"
  read -r -p "Proceed with cleanup? (y/N): " confirm
else
  confirm="y"
fi

if [[ "${confirm}" == "Y" || "${confirm}" == "y" ]]; then
  echo -e "${YELLOW}Cleaning repository (git clean -xdf)...${NC}"
  git clean -xdf "${EXCLUDE_ARGS[@]}"

  echo -e "${GREEN}\nRepository cleaned successfully.${NC}"
else
  echo -e "${YELLOW}Cleanup cancelled.${NC}"
  exit 1
fi
