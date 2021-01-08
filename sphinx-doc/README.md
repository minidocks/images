Sphinx docker image (minidocks/sphinx-doc)
==========================================

![](https://upload.wikimedia.org/wikipedia/en/d/dc/Sphinx_Python_Documentation_Logo.png)

[Sphinx](https://www.sphinx-doc.org/) is a documentation generator that converts reStructuredText files
into HTML websites and other formats including PDF, EPub, Texinfo and man.

reStructuredText is extensible, and Sphinx exploits its extensible nature through a number
of extensions – for autogenerating documentation from source code, writing mathematical
notation or highlighting source code, etc.

Installed extensions
--------------------

### Themes

- [Awesome](https://sphinxawesome.xyz/)
- [Book](https://sphinx-book-theme.readthedocs.io/en/latest/)
- [Documatt](https://gitlab.com/documatt/sphinx-themes)
- [Material](https://github.com/bashtage/sphinx-material)
- [Pallets](https://github.com/pallets/pallets-sphinx-themes)
- [Press](https://schettino72.github.io/sphinx_press_site/)
- [PyData](https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html)
- [Read the Docs](https://github.com/rtfd/sphinx_rtd_theme)

More themes on https://sphinx-themes.org/.

### Extensions

- [Comments](https://sphinx-comments.readthedocs.io/en/latest/)
- [Copy button](https://sphinx-copybutton.readthedocs.io/en/latest/)
- [Kroki](https://github.com/sphinx-contrib/kroki)
- [Multiversion](https://github.com/Holzhaus/sphinx-multiversion)
- [Panels](https://sphinx-panels.readthedocs.io/en/latest/)
- [Prompt](http://sbrunner.github.io/sphinx-prompt/)
- [Tabs](https://github.com/executablebooks/sphinx-tabs)

More extensions on
- https://sphinxext-survey.readthedocs.io/en/latest/
- https://github.com/sphinx-contrib
- https://sphinx-extensions.readthedocs.io/en/latest/
- https://github.com/yoloseem/awesome-sphinxdoc

### Tools

- Multiple sources support included via [sphinx-multibuild](https://github.com/rowanG077/sphinx-multibuild).
- Live-reload web server provided by [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild).
- ReStructuredText validator [rstvalidator](https://github.com/andrewp-as-is/rstvalidator.py).

### Markdown support

- [m2r2](https://github.com/crossnox/m2r2)
- [Markdown parser](https://github.com/codejamninja/sphinx-markdown-parser)
- [MyST](https://myst-parser.readthedocs.io/en/latest/index.html)
- [recommonmark](https://recommonmark.readthedocs.io)

- [Markdown builder](https://github.com/codejamninja/sphinx-markdown-builder)

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

Configuration
-------------

```python

```

Tags
----

 Tag       | Size
 ---       | ----
 latest, 3 | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc.svg)](https://microbadger.com/images/minidocks/sphinx-doc)
 3         | [![](https://images.microbadger.com/badges/image/minidocks/sphinx-doc:3.svg)](https://microbadger.com/images/minidocks/sphinx-doc:3)

Alternatives
------------

- https://github.com/keimlink/docker-sphinx-doc
