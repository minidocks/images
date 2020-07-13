img2pdf docker image (minidocks/img2pdf)
========================================

[img2pdf](https://gitlab.mister-muffin.de/josch/img2pdf) is a tool to lossless conversion of raster images to PDF.

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/img2pdf -o images.pdf *.jpg
```

Tags
----

 Tag         | Size
 ---         | ----
 latest, 0.3 | [![](https://images.microbadger.com/badges/image/minidocks/img2pdf.svg)](https://microbadger.com/images/minidocks/img2pdf)
 0.3         | [![](https://images.microbadger.com/badges/image/minidocks/img2pdf:0.3.svg)](https://microbadger.com/images/minidocks/img2pdf:0.3)

Related images
--------------

- [Ghostscript](https://github.com/minidocks/ghostscript)
- [OCRmyPDF](https://github.com/minidocks/ocrmypdf)
