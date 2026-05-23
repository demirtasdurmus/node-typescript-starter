#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "${REPO_ROOT}" ]]; then
  echo -e "${RED}Error:${NC} This script must be run inside the git repository."
  exit 1
fi

cd "${REPO_ROOT}"

FORCE="${1:-}"

EXCLUDES=(
  # Leading / anchors to repo root only (avoids matching e.g. node_modules/foo/.claude/)
  /.claude/
  /AGENTS.md
  /CLAUDE.md
  /.env
  /cspell.json
)

EXCLUDE_ARGS=()
if [[ ${#EXCLUDES[@]} -gt 0 ]]; then
  for path in "${EXCLUDES[@]}"; do
    EXCLUDE_ARGS+=("-e" "$path")
  done
fi

echo -e "This will remove generated artifacts (dist/, node_modules/, build outputs, etc.)"

if [[ "${FORCE}" != "--force" && "${FORCE}" != "-f" ]]; then
  echo -e "\n${YELLOW}The following files/directories would be deleted:${NC}\n"
  if [[ ${#EXCLUDE_ARGS[@]} -gt 0 ]]; then
    git clean -xdn "${EXCLUDE_ARGS[@]}" | sed 's/^Would remove //'
  else
    git clean -xdn | sed 's/^Would remove //'
  fi
  echo -e "\n${RED}Warning:${NC} This action is irreversible.\n"
  read -r -p "Proceed with cleanup? (y/N): " confirm
else
  confirm="y"
fi

if [[ "${confirm}" == "Y" || "${confirm}" == "y" ]]; then
  echo -e "${YELLOW}Cleaning repository (git clean -xdf)...${NC}"
  if [[ ${#EXCLUDE_ARGS[@]} -gt 0 ]]; then
    git clean -xdf "${EXCLUDE_ARGS[@]}"
  else
    git clean -xdf
  fi

  # git clean can leave node_modules/ behind when an exclude matches paths inside it
  if [[ -d node_modules ]]; then
    echo -e "${YELLOW}git clean left node_modules/ behind; removing with rm -rf...${NC}"
    rm -rf node_modules
  fi
  if [[ -e node_modules ]]; then
    echo -e "${RED}Error:${NC} Failed to remove node_modules/."
    exit 1
  fi

  echo -e "${GREEN}\nRepository cleaned successfully.${NC}"
else
  echo -e "${YELLOW}Cleanup cancelled.${NC}"
  exit 1
fi
