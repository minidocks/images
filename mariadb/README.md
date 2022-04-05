MariaDB docker image ([minidocks/mariadb](https://hub.docker.com/r/minidocks/mariadb))
======================================================================================

![](https://upload.wikimedia.org/wikipedia/commons/c/c9/MariaDB_Logo.png)

[MariaDB](https://mariadb.org/) server is a community developed fork of MySQL
server. Started by core members of the original MySQL team, MariaDB actively
works with outside developers to deliver the most featureful, stable, and sanely
licensed open SQL server in the industry.

Configuration
-------------

The startup configuration is specified in the file `/etc/my.cnf`, and that file
in turn includes any files found in the `/etc/my.cnf.d` directory that end with
`.cnf`.

Environment variables
---------------------

-   `DATABASE_URL`
-   `MYSQL_URL`
-   `MYSQL_USER`
-   `MYSQL_PASSWORD`
-   `MYSQL_DATABASE`

Usage
-----

```bash
docker run --rm -it -e MYSQL_URL="mysql://user:password@host:3306/database_name" minidocks/mariadb
```

```bash
docker run --rm -it -e DATABASE_URL="mysql://user:password@host:3306/database_name" minidocks/mariadb
```

Initializing a fresh instance
-----------------------------

When a container is started for the first time, a new database with the
specified name will be created and initialized with the provided configuration
variables. Furthermore, it will execute files with extensions `.sh`, `.sql`,
`.sql.gz`, `.sql.xz` and `.sql.zst` that are found in
`/docker-entrypoint-initdb.d`.

Tags
----

| Tag          | Size                                                                                                            |
|--------------|-----------------------------------------------------------------------------------------------------------------|
| latest, 10.6 | ![](https://img.shields.io/docker/image-size/minidocks/mariadb/latest?style=flat-square&logo=docker&label=size) |
| 10.6         | ![](https://img.shields.io/docker/image-size/minidocks/mariadb/10.6?style=flat-square&logo=docker&label=size)   |
| 10.5         | ![](https://img.shields.io/docker/image-size/minidocks/mariadb/10.5?style=flat-square&logo=docker&label=size)   |
| 10.4         | ![](https://img.shields.io/docker/image-size/minidocks/mariadb/10.4?style=flat-square&logo=docker&label=size)   |

Alternatives
------------

-   https://github.com/docker-suite/mariadb
-   https://github.com/linuxserver/docker-mariadb
