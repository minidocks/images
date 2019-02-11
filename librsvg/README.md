Librsvg docker image (webuni/librsvg)
=====================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Librsvg.svg/159px-Librsvg.svg.png)

librsvg is a SVG rendering library. The Linux command-line program rsvg uses the library to turn SVG files into raster images.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app webuni/librsvg http://google.com google.pdf
```

Tags
----

 Tag    | Size
 -------| ----
 latest | [![](https://images.microbadger.com/badges/image/webuni/librsvg.svg)](https://microbadger.com/images/webuni/librsvg)
 2.40   | [![](https://images.microbadger.com/badges/image/webuni/librsvg:2.40.svg)](https://microbadger.com/images/webuni/librsvg:2.40)
