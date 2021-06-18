Tesseract docker image (minidocks/tesseract)
============================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Tesseract_OCR_logo_%28Google%29.png/250px-Tesseract_OCR_logo_%28Google%29.png)

Tesseract is an optical character recognition engine. Version 4 adds LSTM based OCR engine and models for many
additional languages and scripts, bringing the total to 116 languages.

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/tesseract:4-eng -l eng file.jpg stdout
```

Tags
----

 Tag       | Size
 ---       | ----
 latest, 4 | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/latest?style=flat-square&logo=docker&label=size)
 4         | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4?style=flat-square&logo=docker&label=size)
 4-europe  | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-europe?style=flat-square&logo=docker&label=size)
 4-bel     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-bel?style=flat-square&logo=docker&label=size)
 4-bos     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-bos?style=flat-square&logo=docker&label=size)
 4-bul     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-bul?style=flat-square&logo=docker&label=size)
 4-cat     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-cat?style=flat-square&logo=docker&label=size)
 4-ces     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-ces?style=flat-square&logo=docker&label=size)
 4-cym     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-cym?style=flat-square&logo=docker&label=size)
 4-dan     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-dan?style=flat-square&logo=docker&label=size)
 4-deu     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-deu?style=flat-square&logo=docker&label=size)
 4-ell     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-ell?style=flat-square&logo=docker&label=size)
 4-eng     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-eng?style=flat-square&logo=docker&label=size)
 4-est     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-est?style=flat-square&logo=docker&label=size)
 4-eus     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-eus?style=flat-square&logo=docker&label=size)
 4-fin     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-fin?style=flat-square&logo=docker&label=size)
 4-fra     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-fra?style=flat-square&logo=docker&label=size)
 4-gle     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-gle?style=flat-square&logo=docker&label=size)
 4-grc     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-grc?style=flat-square&logo=docker&label=size)
 4-hrv     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-hrv?style=flat-square&logo=docker&label=size)
 4-hun     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-hun?style=flat-square&logo=docker&label=size)
 4-ita     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-ita?style=flat-square&logo=docker&label=size)
 4-lat     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-lat?style=flat-square&logo=docker&label=size)
 4-lav     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-lav?style=flat-square&logo=docker&label=size)
 4-nor     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-nor?style=flat-square&logo=docker&label=size)
 4-pol     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-pol?style=flat-square&logo=docker&label=size)
 4-por     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-por?style=flat-square&logo=docker&label=size)
 4-ron     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-ron?style=flat-square&logo=docker&label=size)
 4-rus     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-rus?style=flat-square&logo=docker&label=size)
 4-slk     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-slk?style=flat-square&logo=docker&label=size)
 4-slv     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-slv?style=flat-square&logo=docker&label=size)
 4-spa     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-spa?style=flat-square&logo=docker&label=size)
 4-srp     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-srp?style=flat-square&logo=docker&label=size)
 4-swe     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-swe?style=flat-square&logo=docker&label=size)
 4-ukr     | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/4-ukr?style=flat-square&logo=docker&label=size)
 3         | ![](https://img.shields.io/docker/image-size/minidocks/tesseract/3?style=flat-square&logo=docker&label=size)

Related images
--------------

- [OCRmyPDF](https://github.com/minidocks/ocrmypdf)
