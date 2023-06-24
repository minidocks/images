img2pdf docker image ([minidocks/img2pdf](https://hub.docker.com/r/minidocks/img2pdf))
======================================================================================

[img2pdf](https://gitlab.mister-muffin.de/josch/img2pdf) is a tool to lossless
conversion of raster images to PDF.

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/img2pdf -o images.pdf *.jpg
```

Tags
----

| Tag    | Size                                                                                                            |
|--------|-----------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/img2pdf/latest?style=flat-square&logo=docker&label=size) |

Related images
--------------

- [Ghostscript](https://github.com/minidocks/ghostscript)
- [OCRmyPDF](https://github.com/minidocks/ocrmypdf)
