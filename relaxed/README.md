ReLaXed docker image (minidocks/relaxed)
========================================

![](https://github.com/RelaxedJS/ReLaXed/raw/master/logo-blue.png)

[ReLaXed](https://github.com/RelaxedJS/ReLaXed) creates PDF documents interactively using HTML or Pug (a shorthand for HTML).
It allows complex layouts to be defined with CSS and JavaScript, while writing
the content in a friendly, minimal syntax close to Markdown or LaTeX.

Usage
-----

We must connect relaxed container with a container with chromium browser via the ssh protocol.
The easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:
```yaml
version: '3.4'
services:
  relaxed:
    image: minidocks/relaxed
    volumes:
    - .:/app
    - /tmp:/tmp
    links:
    - chromium
    environment:
       PUPPETEER_EXECUTABLE_PATH: /bin/chromium
       PUPPETEER_ARG_REMOTE_DEBUGGING_ADDRESS: chromium
       PUPPETEER_ARG_REMOTE_DEBUGGING_PORT: 0
       ALIAS_CHROMIUM: ssh chromium chromium
    working_dir: /app

  chromium:
    image: minidocks/chromium
    volumes:
    - .:/app
    - /tmp:/tmp
    cap_add:
    - SYS_ADMIN
    working_dir: /app
    command: sshd
```

And in the same directory run command:
```bash
printf "h1 My document's title\np A paragraph in my document" > document.pug \
&& docker-compose run --rm relaxed document.pug --bo
```

Tags
----

 Tag       | Size
 ---       | ----
 latest    | [![](https://images.microbadger.com/badges/image/minidocks/relaxed.svg)](https://microbadger.com/images/minidocks/relaxed)

Related images
--------------

- [Chromium](https://github.com/minidocks/chromium)
- [Puppeteer](https://github.com/minidocks/puppeteer)
- [WeasyPrint](https://github.com/minidocks/weasyprint)
- [Wkhtmltopdf](https://github.com/minidocks/wkhtmltopdf)
