Pandoc docker image (minidocks/pandoc)
======================================

[Pandoc](https://pandoc.org) is a document converter, widely used as a writing tool (especially by scholars) and as a basis for publishing
workflows.

Extensions
----------

All extensions are instaled in `/pandoc` directory. Directory `/home/user/.pandoc` is symlink to `/pandoc`.

- [Latex template](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Letter template](https://github.com/aaronwolen/pandoc-letter)
- [Resume template](https://github.com/mszep/pandoc_resume)

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/pandoc http://pandoc.org/MANUAL.html -t markdown
```

### Creating a PDF

To produce a pdf pandoc requires a pdf engine (LaTeX, ConTeXt, Weasyprint etc.). We must connect
containers via the ssh protocol. The easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:
```yaml
version: '3.4'

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
docker-compose run --rm pandoc https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt -o manual-latex.pdf

docker-compose run --rm pandoc https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt -t context -o manual-context.pdf
```

It is possible to use custom LaTeX template: 
```bash
docker-compose run --rm pandoc https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/examples/custom-titlepage/custom-titlepage.md --template eisvogel -o custom-titlepage.pdf
```

or ConTeXt template:

```bash
docker-compose run --rm pandoc https://raw.githubusercontent.com/mszep/pandoc_resume/master/markdown/resume.md --template chmduquesne.tex -s -t context --variable papersize=A4 -o resume.pdf
```

Tags
----

 Tag         | Size
 ----------- | ----
 latest, 2.7 | [![](https://images.microbadger.com/badges/image/minidocks/pandoc.svg)](https://microbadger.com/images/minidocks/pandoc)
 2.7         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.7.svg)](https://microbadger.com/images/minidocks/pandoc:2.7)
 2.6         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.6.svg)](https://microbadger.com/images/minidocks/pandoc:2.6)
 2.5         | [![](https://images.microbadger.com/badges/image/minidocks/pandoc:2.5.svg)](https://microbadger.com/images/minidocks/pandoc:2.5)

Related images
--------------

- [ConTeXt](https://github.com/minidocks/context)
- [ReLaXed](https://github.com/minidocks/relaxed)
- [TeXlive](https://github.com/minidocks/texLive)
- [WeasyPrint](https://github.com/minidocks/weasyprint)

See also
--------

- https://github.com/alexeygumirov/pandoc-for-pdf-how-to
