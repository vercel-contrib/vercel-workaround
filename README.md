# vercel-workaround

## It should Just Work™

### Submodule

Vercel does not currently support private git submodules. The kind people are
sharing some solutions, but only options exist to check out just one submodule
in the wrong way or handle our sensitive data in a script like Tower of Babel.
This script avoids those problems in a reasonable, sounder way.

#### Build & Development Settings

> Project -> Settings -> General => Build & Development Settings

| `INSTALL COMMAND` | `bash ./vercel-submodule-workaround.sh && yarn install --immutable` |
| ----------------- | ------------------------------------------------------------------- |

#### Environment Variables

> Project -> Settings -> Environment Variables

| `GITHUB_REPO_CLONE_TOKEN` | `•••••••••••••••` |
| ------------------------- | ----------------- |

### Yarn Berry Offline Cache

It's not recommended to cache `node_modules`, as it can break across node
versions and won't be as fast as you would expect, especially on large projects.
To give you an idea, a `node_modules` folder of 135k uncompressed files (for a
total of 1.2GB) gives a Yarn cache of 2k binary archives (for a total of 139MB)!

#### Build & Development Settings

> Project -> Settings -> General => Build & Development Settings

| `INSTALL COMMAND` | `bash ./vercel-yarn-berry-offline-cache-workaround.sh && yarn install --immutable` |
| ----------------- | ---------------------------------------------------------------------------------- |
