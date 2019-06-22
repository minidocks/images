ABC music image (minidocks/abc)
===============================

![](http://abcplus.sourceforge.net/Scherzando.png)

[ABC](http://abcnotation.com/) notation is a shorthand form of musical notation.

Installed programs
-------------------

- [abcm2ps](https://github.com/leesavide/abcm2ps/)
- [abc2svg](https://chiselapp.com/user/moinejf/repository/abc2svg/doc/trunk/README.md)
- [abc2midi and midi2abc](https://ifdo.ca/~seymour/runabc/top.html)
- [abc2xml](https://wim.vree.org/svgParse/abc2xml.html)
- [xml2abc](https://wim.vree.org/svgParse/xml2abc.html)
- [abc2prt](https://github.com/leesavide/abc2prt)
- [abcpp](https://github.com/leesavide/abcpp)

Usage
-----

```
docker run --rm -it -v "`pwd`:/app" -w /app minidocks/abc abc2svg /usr/local/share/doc/abcm2ps/examples/sample.abc
```

Tags
----

 Tag    | Size
 ---    | ----
 latest | [![](https://images.microbadger.com/badges/image/minidocks/abc.svg)](https://microbadger.com/images/minidocks/abc)
