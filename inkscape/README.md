Inkscape with potrace docker image (minidocks/inkscape)
=======================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Inkscape_Logo.svg/100px-Inkscape_Logo.svg.png)
![](http://potrace.sourceforge.net/logo/potrace-logo-150.png)

[Inkscape](https://inkscape.org) is a free and open-source vector graphics editor. It can be used to create
or edit vector graphics such as illustrations, diagrams, line arts, charts, logos and complex paintings.
Inkscape's primary vector graphics format is Scalable Vector Graphics (SVG), however, many other formats can be imported and exported.

[Potrace](http://potrace.sourceforge.net/) is a tool for tracing a bitmap, which means, transforming a bitmap into a smooth, scalable image.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/inkscape \
    /usr/share/inkscape/screens/about.svg --export-area-drawing --export-pdf=about.pdf
```

If you want to run GUI:
```bash
xhost +
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/app -w /app minidocks/inkscape
```

Tags
----

 Tag       | Size
 ---       | ----
 latest, 1 | [![](https://images.microbadger.com/badges/image/minidocks/inkscape.svg)](https://microbadger.com/images/minidocks/inkscape)
 1         | [![](https://images.microbadger.com/badges/image/minidocks/inkscape:1.svg)](https://microbadger.com/images/minidocks/inkscape:1)
 0.92      | [![](https://images.microbadger.com/badges/image/minidocks/inkscape:0.92.svg)](https://microbadger.com/images/minidocks/inkscape:0.92)
