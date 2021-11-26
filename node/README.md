NodeJS docker image ([minidocks/node](https://hub.docker.com/r/minidocks/node))
===============================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/170px-Node.js_logo.svg.png)

[Node.js](https://nodejs.org) is an open-source, cross-platform JavaScript
run-time environment that executes JavaScript code outside of a browser.

Installed utilities
-------------------

-   [npm](https://docs.npmjs.com/cli/npm) is the package manager for the Node
    JavaScript platform.
-   [npm-check-updates](https://github.com/raineorshine/npm-check-updates)
    upgrades your package.json dependencies to the latest versions, ignoring
    specified versions.
-   [yarn](https://yarnpkg.com/) is a package manager that doubles down as
    project manager.

Configuration by environment variables
--------------------------------------

-   `NODE_PATH` (default `/node_modules`)
-   `NPM_CONFIG_CACHE` (default `/npm-cache`) - Path to directory with npm
    cache.
-   `YARN_CACHE_FOLDER` (default `/yarn-cache`) - Path to directory with yarn
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
| latest, 17            | [![](https://img.shields.io/docker/image-size/minidocks/node/latest?style=flat-square&logo=docker&label=size)]()  |
| 17, current           | [![](https://img.shields.io/docker/image-size/minidocks/node/17?style=flat-square&logo=docker&label=size)]()      |
| 17-base, current-base | [![](https://img.shields.io/docker/image-size/minidocks/node/17-base?style=flat-square&logo=docker&label=size)]() |
| 16, lts               | [![](https://img.shields.io/docker/image-size/minidocks/node/16?style=flat-square&logo=docker&label=size)]()      |
| 16-base, lts-base     | [![](https://img.shields.io/docker/image-size/minidocks/node/16-base?style=flat-square&logo=docker&label=size)]() |
| 15                    | [![](https://img.shields.io/docker/image-size/minidocks/node/15?style=flat-square&logo=docker&label=size)]()      |
| 15-base               | [![](https://img.shields.io/docker/image-size/minidocks/node/15-base?style=flat-square&logo=docker&label=size)]() |
| 14                    | [![](https://img.shields.io/docker/image-size/minidocks/node/14?style=flat-square&logo=docker&label=size)]()      |
| 14-base               | [![](https://img.shields.io/docker/image-size/minidocks/node/14-base?style=flat-square&logo=docker&label=size)]() |
| 13                    | [![](https://img.shields.io/docker/image-size/minidocks/node/13?style=flat-square&logo=docker&label=size)]()      |
| 13-base               | [![](https://img.shields.io/docker/image-size/minidocks/node/13-base?style=flat-square&logo=docker&label=size)]() |
| 12                    | [![](https://img.shields.io/docker/image-size/minidocks/node/12?style=flat-square&logo=docker&label=size)]()      |
| 12-base               | [![](https://img.shields.io/docker/image-size/minidocks/node/12-base?style=flat-square&logo=docker&label=size)]() |
