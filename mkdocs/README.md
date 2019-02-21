MkDocs docker image (minidocks/mkdocs)
======================================

![](https://www.fullstackpython.com/img/logos/mkdocs.jpg)

MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project
documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

Installed themes
----------------

- [A Material Design theme](https://squidfunk.github.io/mkdocs-material/) usings Google's Material Design guidelines.
- [Alabaster theme](https://mkdocs-alabaster.ale.sh/) is a visually (c)lean, responsive, configurable theme.
- [ReadTheDocs Dropdown theme](http://readthedocs.sheets.ch/) with collapsing menu support.

Installed plugins
-----------------

- [Awesome Pages plugin](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin) allows you to customize how your
  pages show up the navigation of your MkDocs without having to configure the full structure in your `mkdocs.yml`.
- [Merge plugin](https://github.com/ovasquez/mkdocs-merge) allows you to merge the source of multiple MkDocs sites into
  a single one converting each of the specified sites to a sub-site of the master site.
- [Pygments](http://pygments.org/) is a generic syntax highlighter.
- [PyMdown Extensions](https://facelessuser.github.io/pymdown-extensions/) is a collection of extensions for Python Markdown.
- [PDF export plugin](https://github.com/shauser/mkdocs-pdf-export-plugin) will export all markdown pages in your project
  as PDF files using WeasyPrint. (only in `1.0-pdf` tag)

Usage
-----

Create a new documentation project in `doc` directory:
```bash
docker run --rm -v `pwd`:/app -w /app minidocks/mkdocs new doc
```

Start documentation server in `doc` directory on port 8000 with material design theme:
```bash
docker run --rm -v `pwd`:/app -w /app/doc -p 8000:8000 minidocks/mkdocs serve -a 0.0.0.0:8000 -t material
```

Tags
----

 Tag         | Size
 ----------- | ----
 latest, 1.0 | [![](https://images.microbadger.com/badges/image/minidocks/mkdocs.svg)](https://microbadger.com/images/minidocks/mkdocs)
 1.0         | [![](https://images.microbadger.com/badges/image/minidocks/mkdocs:1.0.svg)](https://microbadger.com/images/minidocks/mkdocs:1.0)
 1.0-pdf     | [![](https://images.microbadger.com/badges/image/minidocks/mkdocs:1.0-pdf.svg)](https://microbadger.com/images/minidocks/mkdocs:1.0-pdf) 
 0.17        | [![](https://images.microbadger.com/badges/image/minidocks/mkdocs:0.17.svg)](https://microbadger.com/images/minidocks/mkdocs:0.17)
