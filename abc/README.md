ABC music image (minidocks/abc)
===============================

![](http://abcplus.sourceforge.net/Scherzando.png)

[ABC](http://abcnotation.com/) notation is a shorthand form of musical notation.

Installed programs
------------------

-   [abcm2ps](https://github.com/leesavide/abcm2ps/)
-   [abc2svg](https://chiselapp.com/user/moinejf/repository/abc2svg/doc/trunk/README.md)
-   [abc2midi and midi2abc](https://ifdo.ca/~seymour/runabc/top.html)
-   [abc2xml](https://wim.vree.org/svgParse/abc2xml.html)
-   [xml2abc](https://wim.vree.org/svgParse/xml2abc.html)
-   [abc2prt](http://abcplus.sourceforge.net/#abc2prt)
-   [abcpp](http://abcplus.sourceforge.net/#abcpp)

Usage
-----

```shell
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/abc abc2svg /usr/local/share/doc/abcm2ps/examples/sample.abc
```

### Export to PDF

To export abc to pdf, it is necessary to connect a chromium container to the abc
container. So let’s create a docker-compose file:

```yaml
version: '3.6'

x-base: &base
  volumes:
    - .:/app
    - /tmp:/tmp
  working_dir: /app
  command: sshd

services:
  abc:
    <<: *base
    image: minidocks/abc
    links:
      - chromium
    environment:
      ALIAS_CHROMIUM__BROWSER: ssh chromium chromium-browser

  chromium:
    <<: *base
    image: minidocks/chromium
    cap_add:
      - "SYS_ADMIN"
```

Then let’s run the command:

```shell
docker-compose run --rm abc abctopdf local/path/to/file.abc
```

Tags
----

| Tag    | Size                                                                                                        |
|--------|-------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/abc/latest?style=flat-square&logo=docker&label=size) |
