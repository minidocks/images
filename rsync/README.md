Rsync docker image (minidocks/rsync)
====================================

![](https://upload.wikimedia.org/wikipedia/en/1/11/Newrsynclogo.png)

[rsync](https://rsync.samba.org/) rsync is a utility for efficiently
transferring and synchronizing files between a computer and an external hard drive
and across networked computers by comparing the modification times and sizes of files.

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/rsync --help
```

Tags
----

 Tag       | Size
 ---       | ----
 latest, 3 | ![](https://img.shields.io/docker/image-size/minidocks/rsync/latest?style=flat-square&logo=docker&label=size)
 3         | ![](https://img.shields.io/docker/image-size/minidocks/rsync/3?style=flat-square&logo=docker&label=size)

Alternatives
------------

- https://github.com/dprim/rsync-docker

Related images
--------------

- [rclone](https://github.com/minidocks/rclone)
- [lftp](https://github.com/minidocks/lftp)
