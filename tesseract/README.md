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
 latest, 4 | [![](https://images.microbadger.com/badges/image/minidocks/tesseract.svg)](https://microbadger.com/images/minidocks/tesseract)
 4         | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4.svg)](https://microbadger.com/images/minidocks/tesseract:4)
 4-europe  | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-europe.svg)](https://microbadger.com/images/minidocks/tesseract:4-europe)
 4-bel     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-bel.svg)](https://microbadger.com/images/minidocks/tesseract:4-bel)
 4-bos     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-bos.svg)](https://microbadger.com/images/minidocks/tesseract:4-bos)
 4-bul     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-bul.svg)](https://microbadger.com/images/minidocks/tesseract:4-bul)
 4-cat     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-cat.svg)](https://microbadger.com/images/minidocks/tesseract:4-cat)
 4-ces     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-ces.svg)](https://microbadger.com/images/minidocks/tesseract:4-ces)
 4-cym     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-cym.svg)](https://microbadger.com/images/minidocks/tesseract:4-cym)
 4-dan     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-dan.svg)](https://microbadger.com/images/minidocks/tesseract:4-dan)
 4-deu     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-deu.svg)](https://microbadger.com/images/minidocks/tesseract:4-deu)
 4-ell     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-ell.svg)](https://microbadger.com/images/minidocks/tesseract:4-ell)
 4-eng     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-eng.svg)](https://microbadger.com/images/minidocks/tesseract:4-eng)
 4-est     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-est.svg)](https://microbadger.com/images/minidocks/tesseract:4-est)
 4-eus     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-eus.svg)](https://microbadger.com/images/minidocks/tesseract:4-eus)
 4-fin     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-fin.svg)](https://microbadger.com/images/minidocks/tesseract:4-fin)
 4-fra     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-fra.svg)](https://microbadger.com/images/minidocks/tesseract:4-fra)
 4-gle     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-gle.svg)](https://microbadger.com/images/minidocks/tesseract:4-gle)
 4-grc     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-grc.svg)](https://microbadger.com/images/minidocks/tesseract:4-grc)
 4-hrv     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-hrv.svg)](https://microbadger.com/images/minidocks/tesseract:4-hrv)
 4-hun     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-hun.svg)](https://microbadger.com/images/minidocks/tesseract:4-hun)
 4-ita     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-ita.svg)](https://microbadger.com/images/minidocks/tesseract:4-ita)
 4-lat     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-lat.svg)](https://microbadger.com/images/minidocks/tesseract:4-lat)
 4-lav     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-lav.svg)](https://microbadger.com/images/minidocks/tesseract:4-lav)
 4-nor     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-nor.svg)](https://microbadger.com/images/minidocks/tesseract:4-nor)
 4-pol     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-pol.svg)](https://microbadger.com/images/minidocks/tesseract:4-pol)
 4-por     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-por.svg)](https://microbadger.com/images/minidocks/tesseract:4-por)
 4-ron     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-ron.svg)](https://microbadger.com/images/minidocks/tesseract:4-ron)
 4-rus     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-rus.svg)](https://microbadger.com/images/minidocks/tesseract:4-rus)
 4-slk     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-slk.svg)](https://microbadger.com/images/minidocks/tesseract:4-slk)
 4-slv     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-slv.svg)](https://microbadger.com/images/minidocks/tesseract:4-slv)
 4-spa     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-spa.svg)](https://microbadger.com/images/minidocks/tesseract:4-spa)
 4-srp     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-srp.svg)](https://microbadger.com/images/minidocks/tesseract:4-srp)
 4-swe     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-swe.svg)](https://microbadger.com/images/minidocks/tesseract:4-swe)
 4-ukr     | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:4-ukr.svg)](https://microbadger.com/images/minidocks/tesseract:4-ukr)
 3         | [![](https://images.microbadger.com/badges/image/minidocks/tesseract:3.svg)](https://microbadger.com/images/minidocks/tesseract:3)
