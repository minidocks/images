OCRmyPDF with img2pdf docker image (minidocks/ocrmypdf)
=======================================================

![](https://raw.githubusercontent.com/jbarlow83/OCRmyPDF/master/docs/images/logo.svg?sanitize=true)

[OCRmyPDF](https://ocrmypdf.readthedocs.io/) adds an OCR text layer to scanned PDF files, allowing them to be searched.

Utilities
---------

- [img2pdf](https://gitlab.mister-muffin.de/josch/img2pdf) is a tool to lossless conversion of raster images to PDF.
- [pdfminer](https://github.com/pdfminer/pdfminer.six) is a tool for extracting information from PDF documents.
- [hocr tools](https://github.com/tmbdev/hocr-tools)

Usage
-----

OCRmyPDF requires ghostscript, tesseract an unpaper. We must connect these containers via the ssh protocol.
The easiest solution is to use docker compose.

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
docker-compose run --rm ocrmypdf -l eng input.pdf output.pdf
```

Tags
----

 Tag         | Size
 ---         | ----
 latest, 9   | [![](https://images.microbadger.com/badges/image/minidocks/ocrmypdf.svg)](https://microbadger.com/images/minidocks/ocrmypdf)
 9           | [![](https://images.microbadger.com/badges/image/minidocks/ocrmypdf:9.svg)](https://microbadger.com/images/minidocks/ocrmypdf:9)
