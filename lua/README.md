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
 latest, 5.3 | [![](https://images.microbadger.com/badges/image/minidocks/lua.svg)](https://microbadger.com/images/minidocks/lua)
 5.3         | [![](https://images.microbadger.com/badges/image/minidocks/lua:5.3.svg)](https://microbadger.com/images/minidocks/lua:5.3)
 5.3-build   | [![](https://images.microbadger.com/badges/image/minidocks/lua:5.3-build.svg)](https://microbadger.com/images/minidocks/lua:5.3-build)
 5.2         | [![](https://images.microbadger.com/badges/image/minidocks/lua:5.2.svg)](https://microbadger.com/images/minidocks/lua:5.2)
 5.2-build   | [![](https://images.microbadger.com/badges/image/minidocks/lua:5.2-build.svg)](https://microbadger.com/images/minidocks/lua:5.2-build)
 5.1         | [![](https://images.microbadger.com/badges/image/minidocks/lua:5.1.svg)](https://microbadger.com/images/minidocks/lua:5.1)
 5.1-build   | [![](https://images.microbadger.com/badges/image/minidocks/lua:5.1-build.svg)](https://microbadger.com/images/minidocks/lua:5.1-build)

Inspiration
-----------

- https://leafo.net/guides/customizing-the-luarocks-tree.html
