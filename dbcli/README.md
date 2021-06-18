DBCLI docker image ([minidocks/dbcli](https://hub.docker.com/r/minidocks/dbcli))
================================================================================

![](https://www.dbcli.com/images/avatar.png)

[DBCLI](https://www.dbcli.com/) is Commandline Database Clients with
Autocompletion and Syntax Highlighting.

Usage
-----

Run `pgcli`:

```shell
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:pgcli --help
```

Run `mycli`:

```shell
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:mycli --help
```

Run `litecli`:

```shell
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:litecli --help
```

Run `iredis`:

```shell
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:iredis --help
```

Run container with `pgcli`, `mycli` and `litecli`:

```shell
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli sh
```

Tags
----

| Tag     | Size                                                                         |
|---------|------------------------------------------------------------------------------|
| latest  | ![](https://img.shields.io/docker/image-size/minidocks/dbcli/latest?style=flat-square&logo=docker&label=size)         |
| pgcli   | ![](https://img.shields.io/docker/image-size/minidocks/dbcli/pgcli?style=flat-square&logo=docker&label=size)   |
| mycli   | ![](https://img.shields.io/docker/image-size/minidocks/dbcli/mycli?style=flat-square&logo=docker&label=size)   |
| litecli | ![](https://img.shields.io/docker/image-size/minidocks/dbcli/litecli?style=flat-square&logo=docker&label=size) |
| iredis  | ![](https://img.shields.io/docker/image-size/minidocks/dbcli/iredis?style=flat-square&logo=docker&label=size)  |
