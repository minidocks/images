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
 latest, beta | ![](https://img.shields.io/docker/image-size/minidocks/context/latest?style=flat-square&logo=docker&label=size)
 beta         | ![](https://img.shields.io/docker/image-size/minidocks/context/beta?style=flat-square&logo=docker&label=size)
 current      | ![](https://img.shields.io/docker/image-size/minidocks/context/current?style=flat-square&logo=docker&label=size)
 lmtx         | ![](https://img.shields.io/docker/image-size/minidocks/context/lmtx?style=flat-square&logo=docker&label=size)

Related images
--------------

- [TeX Live](https://github.com/minidocks/texlive)
