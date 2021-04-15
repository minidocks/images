TeX Live docker image ([minidocks/texlive](https://hub.docker.com/r/minidocks/texlive))
=======================================================================================

[TeX Live](https://www.tug.org/texlive/) is a free software distribution for the
TeX typesetting system that includes major TeX-related programs, macro packages,
and fonts.

Installed utilities
-------------------

-   [pdfjam](http://go.warwick.ac.uk/pdfjam)
-   [pdfcrop](http://pdfcrop.sourceforge.net/)
-   [Gregorio](http://gregorio-project.github.io/)

Usage
-----

```shell
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/texlive pdftex --version
```

To install packages you can create a new image:

```dockerfile
FROM minidocks/texlive

RUN tlmgr install cm-super
```

Tags
----

| Tag           | Size                                                                            |
|---------------|---------------------------------------------------------------------------------|
| latest, basic | ![](https://images.microbadger.com/badges/image/minidocks/texlive.svg)          |
| basic         | ![](https://images.microbadger.com/badges/image/minidocks/texlive:basic.svg)    |
| small         | ![](https://images.microbadger.com/badges/image/minidocks/texlive:small.svg)    |
| gregorio      | ![](https://images.microbadger.com/badges/image/minidocks/texlive:gregorio.svg) |
| context       | ![](https://images.microbadger.com/badges/image/minidocks/texlive:context.svg)  |
| medium        | ![](https://images.microbadger.com/badges/image/minidocks/texlive:medium.svg)   |
| full          | ![](https://images.microbadger.com/badges/image/minidocks/texlive:full.svg)     |
| 2021          | ![](https://images.microbadger.com/badges/image/minidocks/texlive:2021.svg)     |
| 2020          | ![](https://images.microbadger.com/badges/image/minidocks/texlive:2020.svg)     |
| 2019          | ![](https://images.microbadger.com/badges/image/minidocks/texlive:2019.svg)     |
| 2018          | ![](https://images.microbadger.com/badges/image/minidocks/texlive:2018.svg)     |

Related images
--------------

-   [ConTeXt](https://github.com/minidocks/context)
