MariaDB docker image (minidocks/mariadb)
========================================

![](https://upload.wikimedia.org/wikipedia/commons/c/c9/MariaDB_Logo.png)

[MariaDB](https://mariadb.org/) server is a community developed fork of MySQL server. Started by core members of the
original MySQL team, MariaDB actively works with outside developers to deliver the most featureful, stable, and sanely
licensed open SQL server in the industry.

Environment variables
---------------------

- `DATABASE_URL`
- `MYSQL_URL`
- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_DATABASE`

Usage
-----

```bash
docker run --rm -it -e MYSQL_URL="mysql://user:password@host:3306/database_name" minidocks/mariadb
```

```bash
docker run --rm -it -e DATABASE_URL="mysql://user:password@host:3306/database_name" minidocks/mariadb
```

Tags
----

 Tag          | Size
 ------------ | ----
 latest, 10.4 | [![](https://images.microbadger.com/badges/image/minidocks/mariadb.svg)](https://microbadger.com/images/minidocks/mariadb)
 10.4         | [![](https://images.microbadger.com/badges/image/minidocks/mariadb:10.4.svg)](https://microbadger.com/images/minidocks/mariadb:10.4)
 10.3         | [![](https://images.microbadger.com/badges/image/minidocks/mariadb:10.3.svg)](https://microbadger.com/images/minidocks/mariadb:10.3)
 10.2         | [![](https://images.microbadger.com/badges/image/minidocks/mariadb:10.2.svg)](https://microbadger.com/images/minidocks/mariadb:10.2)
 10.1         | [![](https://images.microbadger.com/badges/image/minidocks/mariadb:10.1.svg)](https://microbadger.com/images/minidocks/mariadb:10.1)
