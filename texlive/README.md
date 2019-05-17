TeX Live docker image (minidocks/texlive)
=========================================

TeX Live is a free software distribution for the TeX typesetting system that includes major TeX-related programs,
macro packages, and fonts.

Installed utilities
-------------------

- [pdfjam](http://go.warwick.ac.uk/pdfjam)
- [pdfcrop](http://pdfcrop.sourceforge.net/)

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/texlive pdftex --version
```

Tags
----

 Tag           | Size
 ---           | ----
 latest, basic | [![](https://images.microbadger.com/badges/image/minidocks/texlive.svg)](https://microbadger.com/images/minidocks/texlive)
 2019          | [![](https://images.microbadger.com/badges/image/minidocks/texlive:2019.svg)](https://microbadger.com/images/minidocks/texlive:2019)
 2018          | [![](https://images.microbadger.com/badges/image/minidocks/texlive:2018.svg)](https://microbadger.com/images/minidocks/texlive:2018)
 basic         | [![](https://images.microbadger.com/badges/image/minidocks/texlive:basic.svg)](https://microbadger.com/images/minidocks/texlive:basic)
