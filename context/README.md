ConTeXt standalone docker image (minidocks/context)
===================================================

![](https://wiki.contextgarden.net/skins/common/images/context/context_logo_inv.png?6c748)

[ConTeXt](https://wiki.contextgarden.net) is a document engineering system based on TeX,
a typesetting system and programming language to typeset and produce documents. This
system is easy to use and enables you to make complex paper and electronic documents.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/context --help
```

If we want to use an another tool (e.g. Inkscape for convert svg image to pdf), we must connect
two containers via the ssh protocol. The easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:
```yaml
version: '3.1'
services:
  context:
    image: minidocks/context
    volumes:
    - .:/app
    links:
    - inkscape
    environment:
      ALIAS_INKSCAPE: ssh inkscape inkscape
    working_dir: /app
    command: context

  inkscape:
    image: minidocks/inkscape
    volumes:
    - .:/app
    working_dir: /app
```

And in the same directory run command:
```bash
docker-compose run --rm context --help
```

Tags
----

 Tag          | Size
 ---          | ----
 latest, beta | [![](https://images.microbadger.com/badges/image/minidocks/context.svg)](https://microbadger.com/images/minidocks/context)
 beta         | [![](https://images.microbadger.com/badges/image/minidocks/context:beta.svg)](https://microbadger.com/images/minidocks/context:beta)
 current      | [![](https://images.microbadger.com/badges/image/minidocks/context:current.svg)](https://microbadger.com/images/minidocks/context:current)
 lmtx         | [![](https://images.microbadger.com/badges/image/minidocks/context:lmtx.svg)](https://microbadger.com/images/minidocks/context:lmtx)

Related images
--------------

- [TeX Live](https://github.com/minidocks/texlive)
