Mailcatcher docker image ([minidocks/mailcatcher](https://hub.docker.com/r/minidocks/mailcatcher))
==================================================================================================

![](https://mailcatcher.me/logo.png)

[MailCatcher](https://mailcatcher.me/) runs a super simple SMTP server which
catches any message sent to it to display in a web interface.

Usage
-----

```shell
docker run --rm -it -p 25:25 -p 80:80 minidocks/mailcatcher
```

Tags
----

| Tag    | Size                                                                       |
|--------|----------------------------------------------------------------------------|
| latest | ![](https://images.microbadger.com/badges/image/minidocks/mailcatcher.svg) |

Related images
--------------

-   [MailDev](https://github.com/minidocks/maildev)
-   [MailHog](https://github.com/minidocks/mailhog)
