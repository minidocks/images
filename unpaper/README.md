Unpaper docker image ([minidocks/unpaper](https://hub.docker.com/r/minidocks/unpaper))
======================================================================================

[unpaper](https://www.flameeyes.com/projects/unpaper) is a post-processing tool
for scanned sheets of paper, especially for book pages that have been scanned
from previously created photocopies. The main purpose is to make scanned book
pages better readable on screen after conversion to PDF. Additionally, unpaper
might be useful to enhance the quality of scanned pages before performing
optical character recognition (OCR).

Usage
-----

```shell
docker run --rm -v "`pwd`:/app" -w /app minidocks/unpaper --help
```

Tags
----

| Tag       | Size                                                                     |
|-----------|--------------------------------------------------------------------------|
| latest, 6 | ![](https://img.shields.io/docker/image-size/minidocks/unpaper/latest?style=flat-square&logo=docker&label=size)   |
| 6         | ![](https://img.shields.io/docker/image-size/minidocks/unpaper/6?style=flat-square&logo=docker&label=size) |
