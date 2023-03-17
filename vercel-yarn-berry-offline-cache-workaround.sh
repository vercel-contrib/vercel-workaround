#!/usr/bin/env bash

set -Eeuxo pipefail

function yarn_berry_offline_cache_workaround {
  if [ "$ENABLE_ROOT_PATH_BUILD_CACHE" == "1" ]; then
    echo "ENABLE_ROOT_PATH_BUILD_CACHE is 1!"
    exit 1
  fi

  echo "Current cacheFolder path: $(yarn config get cacheFolder)"

  echo "Updating cacheFolder path..."
  yarn config set cacheFolder .vercel/cache/yarn
  echo "Done!"
}

yarn_berry_offline_cache_workaround
