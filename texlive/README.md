TeX Live docker image (minidocks/texlive)
=========================================

[TeX Live](https://www.tug.org/texlive/) is a free software distribution for
the TeX typesetting system that includes major TeX-related programs,
macro packages, and fonts.

Installed utilities
-------------------

- [pdfjam](http://go.warwick.ac.uk/pdfjam)
- [pdfcrop](http://pdfcrop.sourceforge.net/)
- [Gregorio](http://gregorio-project.github.io/)

Usage
-----

```bash
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/texlive pdftex --version
```

To install packages you can create a new image:
```dockerfile
FROM minidocks/texlive

RUN tlmgr install cm-super
```

Tags
----

 Tag           | Size
 ---           | ----
 latest, basic | [![](https://images.microbadger.com/badges/image/minidocks/texlive.svg)](https://microbadger.com/images/minidocks/texlive)
 basic         | [![](https://images.microbadger.com/badges/image/minidocks/texlive:basic.svg)](https://microbadger.com/images/minidocks/texlive:basic)
 small         | [![](https://images.microbadger.com/badges/image/minidocks/texlive:small.svg)](https://microbadger.com/images/minidocks/texlive:small)
 gregorio      | [![](https://images.microbadger.com/badges/image/minidocks/texlive:gregorio.svg)](https://microbadger.com/images/minidocks/texlive:gregorio)
 context       | [![](https://images.microbadger.com/badges/image/minidocks/texlive:context.svg)](https://microbadger.com/images/minidocks/texlive:context)
 medium        | [![](https://images.microbadger.com/badges/image/minidocks/texlive:medium.svg)](https://microbadger.com/images/minidocks/texlive:medium)
 full          | [![](https://images.microbadger.com/badges/image/minidocks/texlive:full.svg)](https://microbadger.com/images/minidocks/texlive:full)
 2019          | [![](https://images.microbadger.com/badges/image/minidocks/texlive:2019.svg)](https://microbadger.com/images/minidocks/texlive:2019)
 2018          | [![](https://images.microbadger.com/badges/image/minidocks/texlive:2018.svg)](https://microbadger.com/images/minidocks/texlive:2018)

Related images
--------------

- [ConTeXt](https://github.com/minidocks/context)
