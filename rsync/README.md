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
 latest, 3 | [![](https://images.microbadger.com/badges/image/minidocks/rsync.svg)](https://microbadger.com/images/minidocks/rsync)
 3         | [![](https://images.microbadger.com/badges/image/minidocks/rsync:3.svg)](https://microbadger.com/images/minidocks/rsync:3)

Related images
--------------

- [lftp](https://github.com/minidocks/lftp)
