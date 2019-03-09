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

 Tag         | Size
 ---         | ----
 latest, 4   | [![](https://images.microbadger.com/badges/image/minidocks/tesseract.svg)](https://microbadger.com/images/minidocks/tesseract)
 4           | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4.svg)](https://microbadger.com/images/minidocks/tesseract:4)
 3           | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:3.svg)](https://microbadger.com/images/minidocks/tesseract:3)
