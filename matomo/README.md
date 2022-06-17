Flarum docker image ([minidocks/matomo](https://hub.docker.com/r/minidocks/matomo))
===================================================================================

![](https://m-img.org/spai/w_170+q_lossless+ret_img+to_webp/https://static.matomo.org/wp-content/uploads/2018/10/matomo-logo-final-1-340x50.png)

[Matomo](https://matomo.org/) is Google Analytics alternative that protects your data and your customers' privacy.

Configuration
-------------

Database credentials

-   `DATABASE_URL` or `MATOMO_DATABASE_HOST`, `MATOMO_DATABASE_USERNAME`, `MATOMO_DATABASE_PASSWORD`,
    `MATOMO_DATABASE_DBNAME`, `MATOMO_DATABASE_PORT` (default 3306)

Matomo

-   `MATOMO_$CATEGORY_$SETTING` (via https://github.com/matomo-org/plugin-EnvironmentVariables)

Usage
-----

```bash
docker run --rm -e DATABASE_URL="mysql://user:password@host:port/database" -p 8000:80 minidocks/matomo
```

Tags
----

| Tag    | Size                                                                                                           |
|--------|----------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/matomo/latest?style=flat-square&logo=docker&label=size) |
| base   | ![](https://img.shields.io/docker/image-size/minidocks/matomo/base?style=flat-square&logo=docker&label=size)   |

Alternatives
------------

-   https://github.com/crazy-max/docker-flarum
