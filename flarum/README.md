Flarum docker image ([minidocks/flarum](https://hub.docker.com/r/minidocks/flarum))
===================================================================================

![](https://camo.githubusercontent.com/3f93c6ca5b95a88a9c516bde29bc6d092cec6c9a67dbe39e537b1bb5b07d2e57/68747470733a2f2f666c6172756d2e6f72672f6173736574732f696d672f6c6f676f2e706e67)

[Flarum](https://flarum.org/) is Internet forum software.

Configuration
-------------

Database credentials

-   `DATABASE_URL` or `MYSQL_HOST`, `MYSQL_USER`, `MYSQL_PASSWORD`,
    `MYSQL_DATABASE`, `MYSQL_PORT` (default 3306)

Flarum

-   `FLARUM_BASE_URL`
-   `FLARUM_FORUM_TITLE`
-   `FLARUM_DEBUG` (default false)
-   `FLARUM_OFFLINE` (default false)
-   `FLARUM_API_PATH` (default api)
-   `FLARUM_ADMIN_PATH` (default admin)
-   `FLARUM_POWEREDBY_HEADER` (default empty)
-   `FLARUM_REFERRER_POLICY` (default empty)
-   `FLARUM_COOKIE_SAMESITE` (default lax)

Admin user

-   `FLARUM_ADMIN_NAME` (default flarum)
-   `FLARUM_ADMIN_PASSWORD` (default flarum)
-   `FLARUM_ADMIN_EMAIL`

Usage
-----

```bash
docker run --rm -e DATABASE_URL="mysql://user:password@host:port/database" -p 8000:8000 minidocks/flarum
```

Tags
----

| Tag    | Size                                                                                                           |
|--------|----------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/flarum/latest?style=flat-square&logo=docker&label=size) |
| base   | ![](https://img.shields.io/docker/image-size/minidocks/flarum/base?style=flat-square&logo=docker&label=size)   |

Alternatives
------------

-   https://github.com/crazy-max/docker-flarum
-   https://github.com/mondediefr/docker-flarum
