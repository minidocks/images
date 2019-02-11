ConTeXt standalone docker image (webuni/context)
================================================

![](https://wiki.contextgarden.net/skins/common/images/context/context_logo_inv.png?6c748)

ConTeXt is a document engineering system based on TeX, a typesetting system and programming
language to typeset and produce documents. Ths system is easy to use and enables you
to make complex paper and electronic documents.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app webuni/context --help
```

If we want to use an another tool (e.g. Inkscape for convert svg image to pdf), we must connect
two containers via the ssh protocol. The easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:
```yaml
version: '3.1'
services:
  context:
    image: webuni/context
    volumes:
    - .:/app
    links:
    - inkscape
    environment:
      ALIAS_INKSCAPE: ssh inkscape inkscape
    working_dir: /app
    command: context

  inkscape:
    image: webuni/inkscape
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
 latest, beta | [![](https://images.microbadger.com/badges/image/webuni/context.svg)](https://microbadger.com/images/webuni/context)
 beta         | [![](https://images.microbadger.com/badges/image/webuni/context:beta.svg)](https://microbadger.com/images/webuni/context:beta)
 current      | [![](https://images.microbadger.com/badges/image/webuni/context:current.svg)](https://microbadger.com/images/webuni/context:current)

