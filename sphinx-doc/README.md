Sphinx docker image ([minidocks/sphinx-doc](https://hub.docker.com/r/minidocks/sphinx-doc))
===========================================================================================

![](https://upload.wikimedia.org/wikipedia/en/d/dc/Sphinx_Python_Documentation_Logo.png)

[Sphinx](https://www.sphinx-doc.org/) is a documentation generator that converts
reStructuredText files into HTML websites and other formats including PDF, EPub,
Texinfo and man.

reStructuredText is extensible, and Sphinx exploits its extensible nature
through a number of extensions – for autogenerating documentation from source
code, writing mathematical notation or highlighting source code, etc.

Installed extensions
--------------------

### Themes

-   [Awesome](https://sphinxawesome.xyz)
-   [Book](https://sphinx-book-theme.readthedocs.io/en/latest)
-   [Documatt](https://gitlab.com/documatt/sphinx-themes)
-   [Furo](https://pradyunsg.me/furo)
-   [Immaterial](https://jbms.github.io/sphinx-immaterial/)
-   [Material](https://github.com/bashtage/sphinx-material)
-   [Pallets](https://github.com/pallets/pallets-sphinx-themes)
-   [Press](https://schettino72.github.io/sphinx_press_site)
-   [PyData](https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html)
-   [Read the Docs](https://github.com/rtfd/sphinx_rtd_theme)

#### Pdf themes (only *minidocks/sphinx-doc:\*-pdf*)

-   [Business](https://github.com/Nekmo/sphinx-business-theme)

More themes on https://sphinx-themes.org/.

### Extensions

-   [Comments](https://sphinx-comments.readthedocs.io)
-   [Confluence Builder](https://github.com/sphinx-contrib/confluencebuilder)
-   [Copy button](https://sphinx-copybutton.readthedocs.io)
-   [Design](https://sphinx-design.readthedocs.io)
-   [Inline tabs](https://sphinx-inline-tabs.readthedocs.io)
-   [Kroki](https://github.com/sphinx-contrib/kroki)
-   [Multiversion](https://github.com/Holzhaus/sphinx-multiversion)
-   [OpenAPI](https://sphinxcontrib-openapi.readthedocs.io)
-   [Panels](https://sphinx-panels.readthedocs.io)
-   [Prompt](http://sbrunner.github.io/sphinx-prompt/)
-   [Sitemap](https://github.com/jdillard/sphinx-sitemap)
-   [Tabs](https://github.com/executablebooks/sphinx-tabs)
-   [Toolbox](https://sphinx-toolbox.readthedocs.io)

#### Pdf extensions (only *minidocks/sphinx-doc:\*-pdf*)

-   [rst2pdf](https://rst2pdf.org/)
-   [WeasyPrint](https://procrastinator.nerv-project.eu/nerv-project/sphinx_weasyprint_builder)

More extensions on

-   https://sphinxext-survey.readthedocs.io/en/latest/
-   https://github.com/sphinx-contrib
-   https://sphinx-extensions.readthedocs.io/en/latest/
-   https://github.com/yoloseem/awesome-sphinxdoc

### Tools

-   Multiple sources support included via
    [sphinx-multibuild](https://github.com/rowanG077/sphinx-multibuild).
-   Live-reload web server provided by
    [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild).
-   A tool for converting ReStructuredText to MyST Markdown
    [rst-to-myst](https://rst-to-myst.readthedocs.io)

### Markdown support

-   [Markdown parser](https://github.com/codejamninja/sphinx-markdown-parser)
-   [MInclude](https://github.com/jreese/sphinx-mdinclude)
-   [Markdown builder](https://github.com/codejamninja/sphinx-markdown-builder)
-   [MyST](https://myst-parser.readthedocs.io/en/latest/index.html)

Usage
-----

Generate a new documentation:

```bash
docker run --rm -it -v `pwd`:/doc -w /doc minidocks/sphinx-doc sphinx-quickstart .
```

Run a documentation server:

```bash
docker run --rm -v `pwd`:/doc -w /doc -p 8000:8000 minidocks/sphinx-doc sphinx-autobuild -H 0.0.0.0 . _build/
```

Custom docker image
-------------------

Create own image with a custom theme:

```dockerfile
FROM minidocks/sphinx-doc

RUN pip install sphinx_rtd_theme && clean
```

Tags
----

| Tag       | Size                                                                                                               |
|-----------|--------------------------------------------------------------------------------------------------------------------|
| latest, 4 | ![](https://img.shields.io/docker/image-size/minidocks/sphinx-doc/latest?style=flat-square&logo=docker&label=size) |
| pdf       | ![](https://img.shields.io/docker/image-size/minidocks/sphinx-doc/pdf?style=flat-square&logo=docker&label=size)    |
| 4         | ![](https://img.shields.io/docker/image-size/minidocks/sphinx-doc/4?style=flat-square&logo=docker&label=size)      |
| 4-pdf     | ![](https://img.shields.io/docker/image-size/minidocks/sphinx-doc/4-pdf?style=flat-square&logo=docker&label=size)  |

Related images
--------------

-   [MkDocs](https://github.com/minidocks/mkdocs)

Alternatives
------------

-   https://github.com/keimlink/docker-sphinx-doc
