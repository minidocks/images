Zint docker image ([minidocks/zint](https://hub.docker.com/r/minidocks/zint))
=============================================================================

![](https://www.zint.org.uk/images/website/zint.png)

[Zint](https://www.zint.org.uk/) project aims to provide a complete
cross-platform open source barcode generating solution.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/zint -o here.png -d "This Text"
```

Tags
----

| Tag    | Size                                                                                                         |
|--------|--------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/zint/latest?style=flat-square&logo=docker&label=size) |
