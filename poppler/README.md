Poppler docker image (minidocks/poppler)
========================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Poppler_logotype.svg/150px-Poppler_logotype.svg.png)

Poppler is an utility library for rendering PDF documents.

Utilities
---------

- pdftotext
- pdfunite
- pdftops
- pdffonts
- pdftohtml
- pdfimages
- pdfinfo
- pdftocairo
- pdftoppm
- pdfseparate
- pdfdetach

Usage
-----

```bash
docker run --rm  -v "`pwd`:/app" -w /app minidocks/poppler pdftotext --help
```

Tags
----

 Tag    | Size
 ---    | ----
 latest | [![](https://images.microbadger.com/badges/image/minidocks/poppler.svg)](https://microbadger.com/images/minidocks/poppler)
 0.56   | [![](https://images.microbadger.com/badges/image/minidocks/poppler:0.56.svg)](https://microbadger.com/images/minidocks/poppler:0.56)
