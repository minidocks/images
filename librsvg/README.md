Librsvg docker image (minidocks/librsvg)
========================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Librsvg.svg/159px-Librsvg.svg.png)

librsvg is a SVG rendering library. The Linux command-line program rsvg uses the library to turn SVG files into raster images.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/librsvg http://google.com google.pdf
```

Tags
----

 Tag    | Size
 ---    | ----
 latest | ![](https://img.shields.io/docker/image-size/minidocks/librsvg/latest?style=flat-square&logo=docker&label=size)
 2.40   | ![](https://img.shields.io/docker/image-size/minidocks/librsvg/2.40?style=flat-square&logo=docker&label=size)
