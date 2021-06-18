Wkhtmltopdf docker image ([minidocks/wkhtmltopdf](https://hub.docker.com/r/minidocks/wkhtmltopdf))
==================================================================================================

![](https://wkhtmltopdf.org/images/logo.png)

[wkhtmltopdf](https://wkhtmltopdf.org/) and wkhtmltoimage are command line tools
to render HTML into PDF and various image formats using the Qt WebKit rendering
engine. These run entirely “headless” and do not require a display or display
service.

Usage
-----

```shell
docker run --rm -v `pwd`:/app -w /app minidocks/wkhtmltopdf http://google.com google.pdf
```

Tags
----

| Tag          | Size                                                                            |
|--------------|---------------------------------------------------------------------------------|
| latest, 0.12 | ![](https://img.shields.io/docker/image-size/minidocks/wkhtmltopdf/latest?style=flat-square&logo=docker&label=size)      |
| 0.12         | ![](https://img.shields.io/docker/image-size/minidocks/wkhtmltopdf/0.12?style=flat-square&logo=docker&label=size) |

Related images
--------------

-   [Puppeteer](https://github.com/minidocks/puppeteer)
-   [WeasyPrint](https://github.com/minidocks/weasyprint)
