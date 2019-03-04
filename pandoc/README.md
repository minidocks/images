Pandoc docker image (minidocks/pandoc)
======================================

Pandoc is a document converter, widely used as a writing tool (especially by scholars) and as a basis for publishing
workflows.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/pandoc http://pandoc.org/MANUAL.html -t markdown
```

### Creating a PDF

To produce a pdf pandoc requires a pdf engine (LaTeX, ConTeXt, Weasyprint etc.). We must connect
two containers via the ssh protocol. The easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:
```yaml
version: '3.1'
services:
  context:
    image: minidocks/context
    volumes:
    - .:/app
    working_dir: /app
    command: sshd

  pandoc:
    image: minidocks/pandoc
    volumes:
    - .:/app
    working_dir: /app
    links:
    - context
    environment:
      ALIAS_CONTEXT: ssh context context
```

And in the same directory run command:
```bash
docker-compose run --rm pandoc https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt -t context -o manual.pdf
```

Tags
----

 Tag         | Size
 ----------- | ----
 latest, 2.7 | [![](https://images.microbadger.com/badges/image/minidocks/pandoc.svg)](https://microbadger.com/images/minidocks/pandoc)
 2.7         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.7.svg)](https://microbadger.com/images/minidocks/pandoc:2.7)
 2.6         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.6.svg)](https://microbadger.com/images/minidocks/pandoc:2.6)
 2.5         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.5.svg)](https://microbadger.com/images/minidocks/pandoc:2.5)
 2.4         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.4.svg)](https://microbadger.com/images/minidocks/pandoc:2.4)
 2.3         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.3.svg)](https://microbadger.com/images/minidocks/pandoc:2.3)
