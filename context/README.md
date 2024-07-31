ConTeXt standalone docker image ([minidocks/context](https://hub.docker.com/r/minidocks/context))
=================================================================================================

![](https://wiki.contextgarden.net/skins/common/images/context/context_logo_inv.png?6c748)

[ConTeXt](https://wiki.contextgarden.net) is a document engineering system based
on TeX, a typesetting system and programming language to typeset and produce
documents. This system is easy to use and enables you to make complex paper and
electronic documents.

Additional modules
------------------

- [Lua widow control](https://github.com/gucci-on-fleek/lua-widow-control):
  Automatically remove widows and orphans from any document.
- [Markdown](https://github.com/Witiko/markdown): A package for converting and
  rendering Markdown documents in TeX.

Fonts
-----

- [Quivira](http://quivira-font.com/) is a proportional Unicode serif font that
  contains more than the standard characters for some western European
  languages.
- [Catrinity](https://catrinity-font.de/) is a free sans-serif OpenType font
  that contains a lot of characters for various languages, plus many symbols,
  including colorful emoji.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/context --help
```

If we want to use a different tool (e.g. Inkscape for convert svg image to pdf),
we must connect two containers via the ssh protocol. The easiest solution is to
use docker compose.

So create a file `compose.yaml` with content:

```yaml
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
docker compose run --rm context --help
```

Tags
----

| Tag               | Size                                                                                                                       |
|-------------------|----------------------------------------------------------------------------------------------------------------------------|
| latest            | ![](https://img.shields.io/docker/image-size/minidocks/context/latest?style=flat-square&logo=docker&label=size)            |
| latest-with-fonts | ![](https://img.shields.io/docker/image-size/minidocks/context/latest-with-fonts?style=flat-square&logo=docker&label=size) |
| latest-with-docs  | ![](https://img.shields.io/docker/image-size/minidocks/context/latest-with-docs?style=flat-square&logo=docker&label=size)  |

Related images
--------------

- [TeX Live](https://github.com/minidocks/texlive)

Alternatives
------------

- https://github.com/islandoftex/context
