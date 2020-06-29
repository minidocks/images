JAVA docker image (minidocks/java)
==================================

![](https://upload.wikimedia.org/wikipedia/en/thumb/3/30/Java_programming_language_logo.svg/100px-Java_programming_language_logo.svg.png)

[Java](https://www.java.com/) is a general-purpose programming language that is class-based, object-oriented,
and designed to have as few implementation dependencies as possible.

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
 11     | [![](https://images.microbadger.com/badges/image/minidocks/java:11.svg)](https://microbadger.com/images/minidocks/java:11)
 11-jre | [![](https://images.microbadger.com/badges/image/minidocks/java:11-jre.svg)](https://microbadger.com/images/minidocks/java:11-jre)
 11-gui | [![](https://images.microbadger.com/badges/image/minidocks/java:11-gui.svg)](https://microbadger.com/images/minidocks/java:11-gui)
 10     | [![](https://images.microbadger.com/badges/image/minidocks/java:10.svg)](https://microbadger.com/images/minidocks/java:10)
 10-jre | [![](https://images.microbadger.com/badges/image/minidocks/java:10-jre.svg)](https://microbadger.com/images/minidocks/java:10-jre)
 10-gui | [![](https://images.microbadger.com/badges/image/minidocks/java:10-gui.svg)](https://microbadger.com/images/minidocks/java:10-gui)
 9      | [![](https://images.microbadger.com/badges/image/minidocks/java:9.svg)](https://microbadger.com/images/minidocks/java:9)
 9-jre  | [![](https://images.microbadger.com/badges/image/minidocks/java:9-jre.svg)](https://microbadger.com/images/minidocks/java:9-jre)
 9-gui  | [![](https://images.microbadger.com/badges/image/minidocks/java:9-gui.svg)](https://microbadger.com/images/minidocks/java:9-gui)
 8      | [![](https://images.microbadger.com/badges/image/minidocks/java:8.svg)](https://microbadger.com/images/minidocks/java:8)
 8-jre  | [![](https://images.microbadger.com/badges/image/minidocks/java:8-jre.svg)](https://microbadger.com/images/minidocks/java:8-jre)
 8-gui  | [![](https://images.microbadger.com/badges/image/minidocks/java:8-gui.svg)](https://microbadger.com/images/minidocks/java:8-gui)
 7      | [![](https://images.microbadger.com/badges/image/minidocks/java:7.svg)](https://microbadger.com/images/minidocks/java:7)
 7-jre  | [![](https://images.microbadger.com/badges/image/minidocks/java:7-jre.svg)](https://microbadger.com/images/minidocks/java:7-jre)
 7-gui  | [![](https://images.microbadger.com/badges/image/minidocks/java:7-gui.svg)](https://microbadger.com/images/minidocks/java:7-gui)
