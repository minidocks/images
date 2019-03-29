Sphinx docker image (minidocks/sphinx-doc)
==========================================

![](https://upload.wikimedia.org/wikipedia/en/d/dc/Sphinx_Python_Documentation_Logo.png)

Sphinx is a documentation generator that converts reStructuredText files into HTML websites
and other formats including PDF, EPub, Texinfo and man.

reStructuredText is extensible, and Sphinx exploits its extensible nature through a number
of extensions – for autogenerating documentation from source code, writing mathematical
notation or highlighting source code, etc.

Features
--------

- Markdown support included via [recommonmark](https://recommonmark.readthedocs.io) and [m2r](https://github.com/miyakogi/m2r) extensions.
- Multiple sources support included via [sphinx-multibuild](https://github.com/rowanG077/sphinx-multibuild).
- Livereload web server provided by [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild).
- Themes: [Read the Docs](https://github.com/rtfd/sphinx_rtd_theme)
- Plugins: [Tabbed views](https://github.com/djungelorm/sphinx-tabs)

Usage
-----

Create own image with custom theme:
```docker
FROM minidocks/sphinx-doc

RUN pip install sphinx_rtd_theme && clean
```

Generate a new documentation:
``` bash
docker run --rm -it -v `pwd`:/doc -w /doc minidocks/sphinx-doc sphinx-quickstart .
```

And run documentation server:
``` bash
docker run --rm -v `pwd`:/doc -w /doc -p 8000:8000 minidocks/sphinx-doc sphinx-autobuild -H 0.0.0.0 . _build/
```

Tags
----

 Tag         | Size
 ---         | ----
 latest, 2.0 | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc.svg)](https://microbadger.com/images/minidocks/sphinx-doc)
 2.0         | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc:2.0.svg)](https://microbadger.com/images/minidocks/sphinx-doc:2.0)
 1.8         | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc:1.8.svg)](https://microbadger.com/images/minidocks/sphinx-doc:1.8)
 1.7         | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc:1.7.svg)](https://microbadger.com/images/minidocks/sphinx-doc:1.7)
 1.6         | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc:1.6.svg)](https://microbadger.com/images/minidocks/sphinx-doc:1.6)
