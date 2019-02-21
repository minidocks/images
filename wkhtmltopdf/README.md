Wkhtmltopdf docker image (minidocks/wkhtmltopdf)
================================================

![](https://wkhtmltopdf.org/images/logo.png)

wkhtmltopdf and wkhtmltoimage are command line tools to render HTML into PDF and various image formats
using the Qt WebKit rendering engine. These run entirely "headless" and do not require a display or display service.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/wkhtmltopdf http://google.com google.pdf
```

Tags
----

 Tag          | Size
 ---          | ----
 latest, 0.12 | [![](https://images.microbadger.com/badges/image/minidocks/wkhtmltopdf.svg)](https://microbadger.com/images/minidocks/wkhtmltopdf)
 0.12         | [![](https://images.microbadger.com/badges/image/minidocks/wkhtmltopdf:0.12.svg)](https://microbadger.com/images/minidocks/wkhtmltopdf:0.12)
