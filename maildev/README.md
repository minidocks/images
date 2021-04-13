MailDev docker image ([minidocks/maildev](https://hub.docker.com/r/minidocks/maildev))
======================================================================================

[MailDev](http://maildev.github.io/maildev/) is SMTP Server + Web Interface for
viewing and testing emails during development.

Usage
-----

```shell
docker run --rm -it -p 25:25 -p 80:80 minidocks/maildev
```

Tags
----

| Tag    | Size                                                                   |
|--------|------------------------------------------------------------------------|
| latest | ![](https://images.microbadger.com/badges/image/minidocks/maildev.svg) |

Related images
--------------

-   [MailCatcher](https://github.com/minidocks/mailcatcher)
-   [MailHog](https://github.com/minidocks/mailhog)
