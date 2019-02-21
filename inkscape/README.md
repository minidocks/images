Inkscape docker image (minidocks/inkscape)
==========================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Inkscape_Logo.svg/100px-Inkscape_Logo.svg.png)

Inkscape is a free and open-source vector graphics editor. It can be used to create 
or edit vector graphics such as illustrations, diagrams, line arts, charts, logos and complex paintings.
Inkscape's primary vector graphics format is Scalable Vector Graphics (SVG), however, many other formats can be imported and exported.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/inkscape \
    /usr/share/inkscape/screens/about.svg --export-area-drawing --export-pdf=about.pdf
```

Tags
----

 Tag    | Size
 ---    | ----
 latest | [![](https://images.microbadger.com/badges/image/minidocks/inkscape.svg)](https://microbadger.com/images/minidocks/inkscape)
 0.92   | [![](https://images.microbadger.com/badges/image/minidocks/inkscape:0.92.svg)](https://microbadger.com/images/minidocks/inkscape:0.92)
