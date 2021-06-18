Lua docker image (minidocks/lua)
================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Lua-logo-nolabel.svg/100px-Lua-logo-nolabel.svg.png)

Lua is a lightweight, multi-paradigm programming language designed primarily for embedded use in applications.

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

 Tag         | Size
 ---         | ----
 latest, 5.3 | ![](https://img.shields.io/docker/image-size/minidocks/lua/latest?style=flat-square&logo=docker&label=size)
 5.3         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.3?style=flat-square&logo=docker&label=size)
 5.3-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.3-build?style=flat-square&logo=docker&label=size)
 5.2         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.2?style=flat-square&logo=docker&label=size)
 5.2-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.2-build?style=flat-square&logo=docker&label=size)
 5.1         | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.1?style=flat-square&logo=docker&label=size)
 5.1-build   | ![](https://img.shields.io/docker/image-size/minidocks/lua/5.1-build?style=flat-square&logo=docker&label=size)

Inspiration
-----------

- https://leafo.net/guides/customizing-the-luarocks-tree.html
