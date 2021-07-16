OCRmyPDF with img2pdf docker image ([minidocks/ocrmypdf](https://hub.docker.com/r/minidocks/ocrmypdf))
======================================================================================================

![](https://raw.githubusercontent.com/jbarlow83/OCRmyPDF/master/docs/images/logo.svg?sanitize=true)

[OCRmyPDF](https://ocrmypdf.readthedocs.io/) adds an OCR text layer to scanned
PDF files, allowing them to be searched.

Utilities
---------

-   [img2pdf](https://gitlab.mister-muffin.de/josch/img2pdf) is a tool to
    lossless conversion of raster images to PDF.
-   [pdfminer](https://github.com/pdfminer/pdfminer.six) is a tool for
    extracting information from PDF documents.
-   [hocr tools](https://github.com/tmbdev/hocr-tools)

Usage
-----

OCRmyPDF requires ghostscript, tesseract an unpaper. We must connect these
containers via the ssh protocol. The easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:

```yaml
version: '3.4'

x-base: &base
  volumes:
    - .:/app
    - ./tmp:/tmp
  working_dir: /app
  command: sshd

services:
  ocrmypdf:
    <<: *base
    image: minidocks/ocrmypdf
    links:
      - tesseract
      - unpaper
      - gs
    environment:
      ALIAS_TESSERACT: ssh tesseract tesseract
      ALIAS_UNPAPER: ssh unpaper unpaper
      ALIAS_GS: ssh gs gs

  gs:
    <<: *base
    image: minidocks/ghostscript

  tesseract:
    <<: *base
    image: minidocks/tesseract:4-eng
    environment:
      OMP_THREAD_LIMIT: 1

  unpaper:
    <<: *base
    image: minidocks/unpaper
```

And in the same directory run command:

```bash
docker-compose run --rm ocrmypdf -j 2 -l eng --tesseract-pagesegmode input.pdf output.pdf
```

Tags
----

| Tag        | Size                                                                       |
|------------|----------------------------------------------------------------------------|
| latest, 12 | ![](https://img.shields.io/docker/image-size/minidocks/ocrmypdf/latest?style=flat-square&logo=docker&label=size)    |
| 12         | ![](https://img.shields.io/docker/image-size/minidocks/ocrmypdf/12?style=flat-square&logo=docker&label=size) |
| 11         | ![](https://img.shields.io/docker/image-size/minidocks/ocrmypdf/11?style=flat-square&logo=docker&label=size) |
| 10         | ![](https://img.shields.io/docker/image-size/minidocks/ocrmypdf/10?style=flat-square&logo=docker&label=size) |

Related images
--------------

-   [Ghostscript](https://github.com/minidocks/ghostscript)
-   [pdftk](https://github.com/minidocks/pdftk)
-   [Tesseract](https://github.com/minidocks/tesseract)
-   [Unpaper](https://github.com/minidocks/unpaper)
