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

| Tag           | Size                                                                                                              |
|---------------|-------------------------------------------------------------------------------------------------------------------|
| latest, basic | ![](https://img.shields.io/docker/image-size/minidocks/texlive/latest?style=flat-square&logo=docker&label=size)   |
| basic         | ![](https://img.shields.io/docker/image-size/minidocks/texlive/basic?style=flat-square&logo=docker&label=size)    |
| small         | ![](https://img.shields.io/docker/image-size/minidocks/texlive/small?style=flat-square&logo=docker&label=size)    |
| gregorio      | ![](https://img.shields.io/docker/image-size/minidocks/texlive/gregorio?style=flat-square&logo=docker&label=size) |
| context       | ![](https://img.shields.io/docker/image-size/minidocks/texlive/context?style=flat-square&logo=docker&label=size)  |
| medium        | ![](https://img.shields.io/docker/image-size/minidocks/texlive/medium?style=flat-square&logo=docker&label=size)   |
| full          | ![](https://img.shields.io/docker/image-size/minidocks/texlive/full?style=flat-square&logo=docker&label=size)     |
| 2022          | ![](https://img.shields.io/docker/image-size/minidocks/texlive/2022?style=flat-square&logo=docker&label=size)     |
| 2021          | ![](https://img.shields.io/docker/image-size/minidocks/texlive/2021?style=flat-square&logo=docker&label=size)     |
| 2020          | ![](https://img.shields.io/docker/image-size/minidocks/texlive/2020?style=flat-square&logo=docker&label=size)     |

Related images
--------------

-   [ConTeXt](https://github.com/minidocks/context)
