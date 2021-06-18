Rclone docker image (minidocks/rclone)
======================================

![](https://rclone.org/img/logo_on_dark__horizontal_color.svg)

[Rclone](https://rclone.org/) syncs files to and from cloud storage providers as well as
mounting them, listing them in lots of different ways.

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/rclone --help
```

Configuration file is located in `/etc/rclone/rclone.conf`.

Tags
----

 Tag    | Size
 ---    | ----
 latest | ![](https://img.shields.io/docker/image-size/minidocks/rclone/latest?style=flat-square&logo=docker&label=size)

Related images
--------------

- [rsync](https://github.com/minidocks/rsync)
