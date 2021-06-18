Puppeteer docker image (minidocks/puppeteer)
============================================

![](https://user-images.githubusercontent.com/10379601/29446482-04f7036a-841f-11e7-9872-91d1fc2ea683.png)

[Puppeteer](https://pptr.dev/) is a Node library which provides a high-level
API to control Chrome or Chromium over the DevTools Protocol. Puppeteer runs
headless by default, but can be configured to run full (non-headless) Chrome
 or Chromium.

Improvements
------------

- Resolves ip address `--remote-debugging-address` browser option.
- Supports configuration via environment variables with prefix `PUPPETEER_ARG_`.

Usage
-----

Puppeteer requires link to a container with chromium browser.
So create a file `docker-compose.yml` with content:
```yaml
version: '3.4'
services:
  puppeteer:
    image: minidocks/puppeteer
    volumes:
    - .:/app
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
    cap_add:
    - SYS_ADMIN
    working_dir: /app
    command: sshd
```

And in the same directory run command:
```bash
docker-compose run --rm puppeteer print https://example.com example.pdf
```

Tags
----

 Tag       | Size
---------- | ----
 latest    | ![](https://img.shields.io/docker/image-size/minidocks/puppeteer/latest?style=flat-square&logo=docker&label=size)
 1.12    | ![](https://img.shields.io/docker/image-size/minidocks/puppeteer/1.12?style=flat-square&logo=docker&label=size)

Related images
--------------

- [Chromium](https://github.com/minidocks/chromium)
- [ReLaXed](https://github.com/minidocks/relaxed)
