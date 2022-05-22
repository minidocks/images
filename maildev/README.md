MailDev docker image ([minidocks/maildev](https://hub.docker.com/r/minidocks/maildev))
======================================================================================

[MailDev](http://maildev.github.io/maildev/) is SMTP Server + Web Interface for
viewing and testing emails during development.

Usage
-----

```shell
docker run --rm -it -p 25:25 -p 80:80 minidocks/maildev
```

Configuration
-------------

You can configure MailDev using command line options or environment variables:

| Environment       | Command line | Default | Description             |
|-------------------|--------------|---------|-------------------------|
| MAILDEV_SMTP_PORT | -s, –smtp    | 25      | SMTP port               |
| MAILDEV_WEB_PORT  | -w, –web     | 80      | Port to run the Web GUI |

Tags
----

| Tag    | Size                                                                                                            |
|--------|-----------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/maildev/latest?style=flat-square&logo=docker&label=size) |

Related images
--------------

-   [MailCatcher](https://github.com/minidocks/mailcatcher)
-   [MailHog](https://github.com/minidocks/mailhog)
