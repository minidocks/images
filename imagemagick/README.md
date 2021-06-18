Imagemagick docker image (minidocks/imagemagick)
================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/ImageMagick_logo.svg/100px-ImageMagick_logo.svg.png)

ImageMagick is a free and open-source software suite for displaying, converting, and editing raster image and vector
image files. It can read and write over 200 image file formats.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/imagemagick \
    https://www.ece.rice.edu/~wakin/images/lena512color.tiff -resize 256x256\> -colorspace Gray lenna.png
```

Tags
----

 Tag       | Size
 ---       | ----
 latest, 7 | ![](https://img.shields.io/docker/image-size/minidocks/imagemagick/latest?style=flat-square&logo=docker&label=size)
 7         | ![](https://img.shields.io/docker/image-size/minidocks/imagemagick/7?style=flat-square&logo=docker&label=size)
 6         | ![](https://img.shields.io/docker/image-size/minidocks/imagemagick/6?style=flat-square&logo=docker&label=size)
