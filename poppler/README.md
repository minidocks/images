Poppler docker image ([minidocks/poppler](https://hub.docker.com/r/minidocks/poppler))
======================================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Poppler_logotype.svg/150px-Poppler_logotype.svg.png)

[Poppler](https://poppler.freedesktop.org/) is an utility library for rendering
PDF documents.

Utilities
---------

-   [pdf2svg](https://github.com/dawbarton/pdf2svg) - A simple PDF to SVG
    converter using the Poppler and Cairo libraries.
-   [pdfgrep](https://pdfgrep.org/) - A commandline utility to search text in
    PDF files
-   pdftotext
-   pdfunite
-   pdftops
-   pdffonts
-   pdftohtml
-   pdfimages
-   pdfinfo
-   pdftocairo
-   pdftoppm
-   pdfseparate
-   pdfdetach

Usage
-----

```bash
docker run --rm  -v "`pwd`:/app" -w /app minidocks/poppler pdftotext --help
```

Tags
----

| Tag    | Size                                                                                                            |
|--------|-----------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/poppler/latest?style=flat-square&logo=docker&label=size) |
