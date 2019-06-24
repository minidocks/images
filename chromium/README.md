Chromium docker image (minidocks/chromium)
==========================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Chromium_Material_Icon.png/100px-Chromium_Material_Icon.png)

[Chromium](https://www.chromium.org/Home) is Google's open-source web browser project. It is a fully functional
browser on its own and supplies the vast majority of code for the Google Chrome browser.

Usage
-----

```bash
docker container run -it --rm -v "`pwd`:/app" -w /app --cap-add=SYS_ADMIN minidocks/chromium --headless --screenshot --hide-scrollbars https://www.google.com/
```

Tags
----

 Tag       | Size
 ---       | ----
 latest    | [![](https://images.microbadger.com/badges/image/minidocks/chromium.svg)](https://microbadger.com/images/minidocks/chromium)
 webdriver | [![](https://images.microbadger.com/badges/image/minidocks/chromium:webdriver.svg)](https://microbadger.com/images/minidocks/chromium:webdriver)

Related images
--------------

- [Puppeteer](https://github.com/minidocks/puppeteer)

Alternatives
------------

- https://github.com/Zenika/alpine-chrome
