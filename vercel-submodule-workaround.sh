#!/bin/bash

set -Eeuo pipefail

GITMODULES=".gitmodules"
GITMODULES_BACKUP="${GITMODULES}.bak"

function cleanup {
  echo "Cleaning the runner..."
  rm -f "$GITMODULES" "$GITMODULES_BACKUP"
  git restore "$GITMODULES"
  echo "Done!"
}

trap cleanup EXIT

function submodule_workaround {
  if [ "$GITHUB_REPO_CLONE_TOKEN" == "" ]; then
    echo "GITHUB_REPO_CLONE_TOKEN is empty!"
    exit 1
  fi

  echo "Copying a backup file..."
  cp "$GITMODULES" "$GITMODULES_BACKUP"
  echo "Done!"

  echo "Monkey patching..."
  sed -i "s/git@github.com:/https:\/\/oauth2:${GITHUB_REPO_CLONE_TOKEN}@github.com\//" .gitmodules
  echo "Done!"

  echo "Synchronising submodules' remote URL configuration..."
  git submodule sync
  echo "Done!"

  echo "Updating the registered submodules to match what the superproject expects..."
  git submodule update --init --recursive
  echo "Done!"
}

submodule_workaround
