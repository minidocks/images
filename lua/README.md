Lua docker image ([minidocks/lua](https://hub.docker.com/r/minidocks/lua))
==========================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Lua-Logo.svg/100px-Lua-Logo.svg.png)

[Lua](https://www.lua.org/) is a lightweight, multi-paradigm programming
language designed primarily for embedded use in applications.

Plugins
-------

- [inspect](https://github.com/kikito/inspect.lua) Human-readable representation
  of Lua tables

Usage
-----

```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/lua sh
```

Using luarocks to install packages in the current directory:

```bash
docker run --rm -it -v `pwd`:/app -w /app \
    -e LUA_PATH="lua_modules/share/lua/5.3/?.lua;lua_modules/share/lua/5.3/?/init.lua;;" \
    -e LUA_CPATH="lua_modules/lib/lua/5.3/?.so" \
    minidocks/lua:build luarocks install --tree lua_modules yaml
```

Tags
----

| Tag         | Size                                                                                                           |
|-------------|----------------------------------------------------------------------------------------------------------------|
| latest, 5.4 | ![](https://img.shields.io/docker/image-size/minidocks/lua/latest?style=flat-square&logo=docker&label=size)    |
| 5.4         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.4?style=flat-square&logo=docker&label=size)       |
| 5.4-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.4-build?style=flat-square&logo=docker&label=size) |
| 5.3         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.3?style=flat-square&logo=docker&label=size)       |
| 5.3-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.3-build?style=flat-square&logo=docker&label=size) |
| 5.2         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.2?style=flat-square&logo=docker&label=size)       |
| 5.2-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.2-build?style=flat-square&logo=docker&label=size) |
| 5.1         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.1?style=flat-square&logo=docker&label=size)       |
| 5.1-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.1-build?style=flat-square&logo=docker&label=size) |

Inspiration
-----------

- https://leafo.net/guides/customizing-the-luarocks-tree.html
