# vercel-private-submodule

Vercel does not currently support private git submodules. The kind people are
sharing some solutions, but only options exist to check out just one submodule
in the wrong way or handle our sensitive data in a script like Tower of Babel.
This script avoids those problems in a reasonable, sounder way.

## It should Just Work™

### Build & Development Settings

> Project -> Settings -> General => Build & Development Settings

| `INSTALL COMMAND` | `bash ./vercel-submodule-workaround.sh && yarn install --immutable` |
| ----------------- | ------------------------------------------------------------------- |

### Environment Variables

> Project -> Settings -> Environment Variables

| `GITHUB_REPO_CLONE_TOKEN` | `•••••••••••••••` |
| ------------------------- | ----------------- |
