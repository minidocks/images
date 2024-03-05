MkDocs docker image ([minidocks/mkdocs](https://hub.docker.com/r/minidocks/mkdocs))
===================================================================================

![](https://www.fullstackpython.com/img/logos/mkdocs.jpg)

[MkDocs](https://www.mkdocs.org/) is a fast, simple and downright gorgeous
static site generator that’s geared towards building project documentation.
Documentation source files are written in Markdown, and configured with a single
YAML configuration file.

Installed extensions
--------------------

### Themes

- [Material Design theme](https://squidfunk.github.io/mkdocs-material/) usings
  Google’s Material Design guidelines.
- [Alabaster theme](https://mkdocs-alabaster.ale.sh/) is a visually (c)lean,
  responsive, configurable theme.
- [KPN Theme](https://kpn.github.io/mkdocs-kpn-theme/)

### Plugins

- [Absolute to relative link](https://github.com/sander76/mkdocs-abs-rel-plugin)
- [Add number](https://github.com/ignorantshr/mkdocs-add-number-plugin) plugin
  to automatically number the headings (h1-h6) in each markdown page and the
  nav.
- [Autolinks](https://github.com/midnightprioriem/mkdocs-autolinks-plugin/)
  simplifies relative linking between documents.
- [Autorefs](https://github.com/mkdocstrings/autorefs) automatically link across
  pages.
- [Awesome Pages
  plugin](https://github.com/lukasgeiter/mkdocs-awesome-pages-plugin) allows you
  to customize how your pages show up the navigation of your MkDocs without
  having to configure the full structure in your `mkdocs.yml`.
- [Exclude](https://github.com/apenwarr/mkdocs-exclude) allows you to exclude
  files from your input using unix-style wildcards (globs) or regular
  expressions (regexes).
- [Gallery](https://smarie.github.io/mkdocs-gallery/)
- [Gen files](https://oprypin.github.io/mkdocs-gen-files/) programmatically
  generates documentation pages during the build.
- [Git authors](https://github.com/timvink/mkdocs-git-authors-plugin)
- [Git committers](https://github.com/ojacques/mkdocs-git-committers-plugin-2)
- [Git revision
  date](https://github.com/timvink/mkdocs-git-revision-date-localized-plugin)
- [Merge plugin](https://github.com/ovasquez/mkdocs-merge) allows you to merge
  the source of multiple MkDocs sites into a single one converting each of the
  specified sites to a sub-site of the master site.
- [Enumerate
  headings](https://github.com/timvink/mkdocs-enumerate-headings-plugin) will
  enumerate the headings (h1-h6) across site pages.
- [Img2Fig](https://github.com/stuebersystems/mkdocs-img2fig-plugin) converts
  `<img>` to `<figure>`.
- [Kroki](https://github.com/AVATEAM-IT-SYSTEMHAUS/mkdocs-kroki-plugin)
- [Literate Nav](https://oprypin.github.io/mkdocs-literate-nav/) specifies the
  navigation in Markdown instead of YAML.
- [Macros](https://github.com/fralau/mkdocs_macros_plugin) transforms the
  markdown pages into jinja2 templates that use variables, calls to macros and
  custom filters.
- [Markdown extra
  data](https://github.com/rosscdh/mkdocs-markdownextradata-plugin) injects the
  mkdocs.yml extra variables into the markdown template.
- [Minify](https://github.com/byrnereese/mkdocs-minify-plugin) to minify HTML
  and/or JS files prior to being written to disk.
- [Mkdocstrings](https://mkdocstrings.github.io/) automatic documentation from
  sources.
- [Mkdocs with
  Confluence](https://github.com/pawelsikora/mkdocs-with-confluence/) Plugin for
  uploading markdown documentation to Confluence via Confluence REST API
- [Monorepo](https://github.com/spotify/mkdocs-monorepo-plugin) Build multiple
  documentation in a single Mkdocs. Designed for large codebases.
- [Multirepo](https://github.com/jdoiro3/mkdocs-multirepo-plugin) Build
  documentation in multiple repos into one site.
- [Neoterot plugins](https://www.neoteroi.dev/mkdocs-plugins/)
- [No sitemap](https://github.com/leonardehrenfried/mkdocs-no-sitemap-plugin)
  disables the generation of a sitemap in Mkdocs sites.
- [Print site](https://timvink.github.io/mkdocs-print-site-plugin/index.html)
  adds a page to your site combining all pages, allowing your site visitors to
  `File > Print > Save as PDF` the entire site.
- [Pymdownx Material
  Extras](https://github.com/facelessuser/mkdocs_pymdownx_material_extras)
- [Safe text](https://github.com/raimon49/mkdocs-safe-text-plugin) for safe text
  editing with MKDocs.
- [Same dir](https://oprypin.github.io/mkdocs-same-dir/) allows placing
  mkdocs.yml in the same directory as documentation.
- [Simple hooks](https://github.com/aklajnert/mkdocs-simple-hooks) to define
  your own hooks for mkdocs, without having to create a new package.
- [Simple](https://www.althack.dev/mkdocs-simple-plugin) enables you to build a
  documentation site from markdown interspersed within your repository using
  mkdocs.
- [Swagger UI](https://blueswen.github.io/mkdocs-swagger-ui-tag/)
- [Redirects](https://github.com/datarobot/mkdocs-redirects) to create page
  redirects (e.g. for moved/renamed pages).
- [Versioning](https://github.com/zayd62/mkdocs-versioning)

##### Only in 1-pdf and pdf tags

- [PDF export](https://github.com/zhaoterryy/mkdocs-pdf-export-plugin) will
  export all markdown pages in your project as PDF files using WeasyPrint. (only
  in `pdf` and `1-pdf` tag)
- [PDF generate](https://github.com/orzih/mkdocs-with-pdf) will generate a
  single PDF file from MkDocs repository. (only in `pdf` and `1.0-pdf` tag)

### Markdown extension

- [Include](https://github.com/cmacmackin/markdown-include/) allows the
  inclusion of the contents of other Markdown documents.
- [Pygments](http://pygments.org/) is a generic syntax highlighter.
- [PyMdown Extensions](https://facelessuser.github.io/pymdown-extensions/) is a
  collection of extensions for Python Markdown.

Usage
-----

Create a new documentation project in `doc` directory:

```bash
docker run --rm -v "`pwd`:/app" -w /app minidocks/mkdocs new doc
```

Start documentation server in `doc` directory on port 8000 with material design
theme:

```bash
docker run --rm -v "`pwd`:/app" -w /app/doc -p 8000:8000 minidocks/mkdocs serve -a 0.0.0.0:8000 -t material
```

Tags
----

| Tag       | Size                                                                                                           |
|-----------|----------------------------------------------------------------------------------------------------------------|
| latest, 1 | ![](https://img.shields.io/docker/image-size/minidocks/mkdocs/latest?style=flat-square&logo=docker&label=size) |
| 1         | ![](https://img.shields.io/docker/image-size/minidocks/mkdocs/1?style=flat-square&logo=docker&label=size)      |
| 1-pdf     | ![](https://img.shields.io/docker/image-size/minidocks/mkdocs/1-pdf?style=flat-square&logo=docker&label=size)  |
| pdf       | ![](https://img.shields.io/docker/image-size/minidocks/mkdocs/pdf?style=flat-square&logo=docker&label=size)    |

Related images
--------------

- [Sphinx](https://github.com/minidocks/sphinx-doc)

Alternatives
------------

- https://github.com/raspberryvalley/docker-mkdocs
- https://github.com/pozgo/docker-mkdocs
- https://github.com/squidfunk/mkdocs-material
