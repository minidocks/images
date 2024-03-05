Pandoc docker image ([minidocks/pandoc](https://hub.docker.com/r/minidocks/pandoc))
===================================================================================

![](https://framalibre.org/sites/default/files/styles/thumbnail/public/leslogos/pandoc.png)

[Pandoc](https://pandoc.org) is a document converter, widely used as a writing
tool (especially by scholars) and as a basis for publishing workflows.

Extensions
----------

All extensions are instaled in `/pandoc` directory. Directory
`/home/user/.pandoc` is symlink to `/pandoc`.

### Tools

- [pandoc-lua-logging](https://github.com/wlupton/pandoc-lua-logging)

### Lua filters

- https://github.com/pandoc/lua-filters
- https://github.com/pandocker/pandocker-lua-filters
- https://github.com/PlushBeaver/pandoc-table-filter
- https://github.com/jgm/select-meta
- https://github.com/mitinarseny/panpipe
- https://github.com/tomncooper/pandoc-gls
- https://github.com/a-vrma/pandoc-filters
- https://github.com/jzeneto/pandoc-odt-filters
- https://github.com/hason/pandoc-filters
- https://github.com/teoric/pandoc-filters
- https://github.com/CDSoft/panda
- https://github.com/pandoc-ext

### Templates

- [Latex template](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Letter template](https://github.com/aaronwolen/pandoc-letter)
- [Resume template](https://github.com/mszep/pandoc_resume)
- [Leaflet Template](https://gitlab.com/daamien/pandoc-leaflet-template)

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/pandoc http://pandoc.org/MANUAL.html -t markdown
```

### Creating a PDF

To produce a pdf pandoc requires a pdf engine (LaTeX, ConTeXt, Weasyprint etc.).
We must connect containers via the ssh protocol. The easiest solution is to use
docker compose.

So create a file `compose.yaml` with content:

```yaml
x-base: &base
  volumes:
  - .:/app
  - /tmp:/tmp
  working_dir: /app
  command: sshd

services:
  pandoc:
    <<: *base
    image: minidocks/pandoc
    links:
    - context
    - texlive
    environment:
      ALIAS_CONTEXT: ssh context context
      ALIAS_PDFLATEX: ssh texlive pdflatex

  context:
    <<: *base
    image: minidocks/context:current-with-fonts

  texlive:
    <<: *base
    image: minidocks/texlive:small
```

And in the same directory run command:

```bash
docker compose run --rm pandoc https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt -o manual-latex.pdf

docker compose run --rm pandoc https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt -t context -o manual-context.pdf
```

It is possible to use custom LaTeX template:

```bash
docker compose run --rm pandoc https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/examples/custom-titlepage/custom-titlepage.md --template eisvogel -o custom-titlepage.pdf
```

or ConTeXt template:

```bash
docker compose run --rm pandoc https://raw.githubusercontent.com/mszep/pandoc_resume/master/markdown/resume.md --template chmduquesne.tex -s -t context --variable papersize=A4 -o resume.pdf
```

Tags
----

| Tag       | Size                                                                                                           |
|-----------|----------------------------------------------------------------------------------------------------------------|
| latest, 3 | ![](https://img.shields.io/docker/image-size/minidocks/pandoc/latest?style=flat-square&logo=docker&label=size) |
| 3         | ![](https://img.shields.io/docker/image-size/minidocks/pandoc/3?style=flat-square&logo=docker&label=size)      |
| 2         | ![](https://img.shields.io/docker/image-size/minidocks/pandoc/2?style=flat-square&logo=docker&label=size)      |

Related images
--------------

- [ConTeXt](https://github.com/minidocks/context)
- [ReLaXed](https://github.com/minidocks/relaxed)
- [TeXlive](https://github.com/minidocks/texLive)
- [WeasyPrint](https://github.com/minidocks/weasyprint)

See also
--------

- https://hub.docker.com/r/pandoc/minimal
- https://github.com/alexeygumirov/pandoc-for-pdf-how-to
- https://github.com/dalibo/pandocker
