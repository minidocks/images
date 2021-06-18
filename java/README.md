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
 latest | ![](https://img.shields.io/docker/image-size/minidocks/java/latest?style=flat-square&logo=docker&label=size)
 11     | ![](https://img.shields.io/docker/image-size/minidocks/java/11?style=flat-square&logo=docker&label=size)
 11-jre | ![](https://img.shields.io/docker/image-size/minidocks/java/11-jre?style=flat-square&logo=docker&label=size)
 11-gui | ![](https://img.shields.io/docker/image-size/minidocks/java/11-gui?style=flat-square&logo=docker&label=size)
 10     | ![](https://img.shields.io/docker/image-size/minidocks/java/10?style=flat-square&logo=docker&label=size)
 10-jre | ![](https://img.shields.io/docker/image-size/minidocks/java/10-jre?style=flat-square&logo=docker&label=size)
 10-gui | ![](https://img.shields.io/docker/image-size/minidocks/java/10-gui?style=flat-square&logo=docker&label=size)
 9      | ![](https://img.shields.io/docker/image-size/minidocks/java/9?style=flat-square&logo=docker&label=size)
 9-jre  | ![](https://img.shields.io/docker/image-size/minidocks/java/9-jre?style=flat-square&logo=docker&label=size)
 9-gui  | ![](https://img.shields.io/docker/image-size/minidocks/java/9-gui?style=flat-square&logo=docker&label=size)
 8      | ![](https://img.shields.io/docker/image-size/minidocks/java/8?style=flat-square&logo=docker&label=size)
 8-jre  | ![](https://img.shields.io/docker/image-size/minidocks/java/8-jre?style=flat-square&logo=docker&label=size)
 8-gui  | ![](https://img.shields.io/docker/image-size/minidocks/java/8-gui?style=flat-square&logo=docker&label=size)
 7      | ![](https://img.shields.io/docker/image-size/minidocks/java/7?style=flat-square&logo=docker&label=size)
 7-jre  | ![](https://img.shields.io/docker/image-size/minidocks/java/7-jre?style=flat-square&logo=docker&label=size)
 7-gui  | ![](https://img.shields.io/docker/image-size/minidocks/java/7-gui?style=flat-square&logo=docker&label=size)
