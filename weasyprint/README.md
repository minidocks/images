Weasyprint docker image ([minidocks/weasyprint](https://hub.docker.com/r/minidocks/weasyprint))
===============================================================================================

![](https://weasyprint.readthedocs.io/en/stable/_static/logo.png)

[WeasyPrint](https://weasyprint.org/) is visual rendering engine for HTML and
CSS that can export to PDF. It aims to support web standards for printing.

Usage
-----

```shell
docker run --rm -v `pwd`:/app -w /app minidocks/weasyprint https://weasyprint.org/ weasyprint.pdf
```

Tags
----

| Tag    | Size                                                                                                               |
|--------|--------------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/weasyprint/latest?style=flat-square&logo=docker&label=size) |

Related images
--------------

-   [MkDocs](https://github.com/minidocks/mkdocs)
-   [Puppeteer](https://github.com/minidocks/puppeteer)
-   [Sphinx](https://github.com/minidocks/sphinx-doc)
-   [Wkhtmltopdf](https://github.com/minidocks/wkhtmltopdf)
