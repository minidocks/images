JAVA docker image (minidocks/java)
==================================

![](https://upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/100px-Java_programming_language_logo.svg.png)

Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible.

Usage
-----

```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/java:8 sh
```

If you want to run GUI:
```bash
xhost +
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/app -w /app minidocks/java:8-gui
```

Tags
----

 Tag    | Size
 ---    | ----
 latest | [![](https://images.microbadger.com/badges/image/minidocks/java.svg)](https://microbadger.com/images/minidocks/java)
 8      | [![](https://images.microbadger.com/badges/image/minidocks/inkscape:8.svg)](https://microbadger.com/images/minidocks/inkscape:8)
 8-jre  | [![](https://images.microbadger.com/badges/image/minidocks/inkscape:8-jre.svg)](https://microbadger.com/images/minidocks/inkscape:8-jre)
 8-gui  | [![](https://images.microbadger.com/badges/image/minidocks/inkscape:8-gui.svg)](https://microbadger.com/images/minidocks/inkscape:8-gui)
