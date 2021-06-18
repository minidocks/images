Mailhog docker image ([minidocks/mailhog](https://hub.docker.com/r/minidocks/mailhog))
======================================================================================

![](https://avatars3.githubusercontent.com/u/10258541?s=200&v=4)

[MailHog](https://github.com/mailhog/MailHog) is an email testing tool for
developers.

Usage
-----

```shell
docker run --rm -it -p 25:25 -p 80:80 minidocks/mailhog
```

Configuration
-------------

You can configure MailHog using command line options or environment variables:

| Environment           | Command line    | Default         | Description                                                                               |
|-----------------------|-----------------|-----------------|-------------------------------------------------------------------------------------------|
| MH\_CORS\_ORIGIN      | -cors-origin    |                 | If set, a Access-Control-Allow-Origin header is returned for API endpoints                |
| MH\_HOSTNAME          | -hostname       | mailhog.example | Hostname to use for EHLO/HELO and message IDs                                             |
| MH\_API\_BIND\_ADDR   | -api-bind-addr  | 0.0.0.0:80      | Interface and port for HTTP API server to bind to                                         |
| MH\_UI\_BIND\_ADDR    | -ui-bind-addr   | 0.0.0.0:80      | Interface and port for HTTP UI server to bind to                                          |
| MH\_MAILDIR\_PATH     | -maildir-path   |                 | Maildir path (for maildir storage backend)                                                |
| MH\_MONGO\_COLLECTION | -mongo-coll     | messages        | MongoDB collection name for message storage                                               |
| MH\_MONGO\_DB         | -mongo-db       | mailhog         | MongoDB database name for message storage                                                 |
| MH\_MONGO\_URI        | -mongo-uri      | 127.0.0.1:27017 | MongoDB host and port                                                                     |
| MH\_SMTP\_BIND\_ADDR  | -smtp-bind-addr | 0.0.0.0:25      | Interface and port for SMTP server to bind to                                             |
| MH\_STORAGE           | -storage        | memory          | Set message storage: memory / mongodb / maildir                                           |
| MH\_OUTGOING\_SMTP    | -outgoing-smtp  |                 | JSON file defining outgoing SMTP servers                                                  |
| MH\_UI\_WEB\_PATH     | -ui-web-path    |                 | WebPath under which the ui is served (without leading or trailing slahes), e.g. ‘mailhog’ |

Tags
----

| Tag    | Size                                                                   |
|--------|------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/mailhog/latest?style=flat-square&logo=docker&label=size) |

Related images
--------------

-   [MailCatcher](https://github.com/minidocks/mailcatcher)
-   [MailDev](https://github.com/minidocks/maildev)
