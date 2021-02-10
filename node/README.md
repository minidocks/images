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

``` bash
docker run --rm -v "`pwd`:/app" -w /app minidocks/node --help
```

Tags
----

| Tag        | Size                                                                            |
|------------|---------------------------------------------------------------------------------|
| latest, 15 | [![](https://images.microbadger.com/badges/image/minidocks/node.svg)]()         |
| 15         | [![](https://images.microbadger.com/badges/image/minidocks/node:15.svg)]()      |
| 15-base    | [![](https://images.microbadger.com/badges/image/minidocks/node:15-base.svg)]() |
| 14, lts    | [![](https://images.microbadger.com/badges/image/minidocks/node:14.svg)]()      |
| 14-base    | [![](https://images.microbadger.com/badges/image/minidocks/node:14-base.svg)]() |
| 13         | [![](https://images.microbadger.com/badges/image/minidocks/node:13.svg)]()      |
| 13-base    | [![](https://images.microbadger.com/badges/image/minidocks/node:13-base.svg)]() |
| 12         | [![](https://images.microbadger.com/badges/image/minidocks/node:12.svg)]()      |
| 12-base    | [![](https://images.microbadger.com/badges/image/minidocks/node:12-base.svg)]() |
| 11         | [![](https://images.microbadger.com/badges/image/minidocks/node:11.svg)]()      |
| 11-base    | [![](https://images.microbadger.com/badges/image/minidocks/node:11-base.svg)]() |
| 10         | [![](https://images.microbadger.com/badges/image/minidocks/node:10.svg)]()      |
| 10-base    | [![](https://images.microbadger.com/badges/image/minidocks/node:10-base.svg)]() |
