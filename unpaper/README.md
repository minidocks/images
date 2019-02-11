Unpaper docker image (webuni/unpaper)
=====================================

unpaper is a post-processing tool for scanned sheets of paper, especially for book pages that have been scanned from
previously created photocopies. The main purpose is to make scanned book pages better readable on screen after
conversion to PDF. Additionally, unpaper might be useful to enhance the quality of scanned pages before performing
optical character recognition (OCR).

Usage
-----

```bash
docker run --rm -v "`pwd`:/app" -w /app webuni/unpaper --help
```

Tags
----

 Tag       | Size
 --------- | ----
 latest, 6 | [![](https://images.microbadger.com/badges/image/webuni/unpaper.svg)](https://microbadger.com/images/webuni/unpaper)
 6         | [![](https://images.microbadger.com/badges/image/webuni/unpaper:6.svg)](https://microbadger.com/images/webuni/unpaper:6)
