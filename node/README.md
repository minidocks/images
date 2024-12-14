NodeJS docker image ([minidocks/node](https://hub.docker.com/r/minidocks/node))
===============================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/170px-Node.js_logo.svg.png)

[Node.js](https://nodejs.org) is an open-source, cross-platform JavaScript
run-time environment that executes JavaScript code outside of a browser.

Installed utilities
-------------------

- [npm](https://docs.npmjs.com/cli/npm) is the package manager for the Node
  JavaScript platform.
- [npm-check-updates](https://github.com/raineorshine/npm-check-updates)
  upgrades your package.json dependencies to the latest versions, ignoring
  specified versions.
- [yarn](https://yarnpkg.com/) is a package manager that doubles down as project
  manager.

Configuration by environment variables
--------------------------------------

- `NODE_PATH` (default `/node_modules`)
- `NPM_CONFIG_CACHE` (default `/npm-cache`) - Path to directory with npm cache.
- `YARN_CACHE_FOLDER` (default `/yarn-cache`) - Path to directory with yarn
  cache.

Usage
-----

```bash
docker run --rm -v "`pwd`:/app" -w /app minidocks/node --help
```

Tags
----

| Tag                   | Size                                                                                                              |
|-----------------------|-------------------------------------------------------------------------------------------------------------------|
| latest, 23            | [![](https://img.shields.io/docker/image-size/minidocks/node/latest?style=flat-square&logo=docker&label=size)]()  |
| 23, current           | [![](https://img.shields.io/docker/image-size/minidocks/node/23?style=flat-square&logo=docker&label=size)]()      |
| 23-base, current-base | [![](https://img.shields.io/docker/image-size/minidocks/node/23-base?style=flat-square&logo=docker&label=size)]() |
| 22, lts               | [![](https://img.shields.io/docker/image-size/minidocks/node/22?style=flat-square&logo=docker&label=size)]()      |
| 22-base, lts-base     | [![](https://img.shields.io/docker/image-size/minidocks/node/22-base?style=flat-square&logo=docker&label=size)]() |
| 21                    | [![](https://img.shields.io/docker/image-size/minidocks/node/21?style=flat-square&logo=docker&label=size)]()      |
| 21-base               | [![](https://img.shields.io/docker/image-size/minidocks/node/21-base?style=flat-square&logo=docker&label=size)]() |
| 20                    | [![](https://img.shields.io/docker/image-size/minidocks/node/20?style=flat-square&logo=docker&label=size)]()      |
| 20-base               | [![](https://img.shields.io/docker/image-size/minidocks/node/20-base?style=flat-square&logo=docker&label=size)]() |
