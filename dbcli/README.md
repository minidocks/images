DBCLI docker image (minidocks/dbcli)
====================================

![](https://www.dbcli.com/images/avatar.png)

Commandline Database Clients with Autocompletion and Syntax Highlighting.

Usage
-----

Run `pgcli`:
```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:pgcli --help
```

Run `mycli`:
```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:mycli --help
```

Run `litecli`:
```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli:litecli --help
```

Run container with `pgcli`, `mycli` and `litecli`:
```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/dbcli sh
```

Tags
----

 Tag       | Size
 ---       | ----
 latest    | [![](https://images.microbadger.com/badges/image/minidocks/dbcli.svg)](https://microbadger.com/images/minidocks/dbcli)
 pgcli       | [![](https://images.microbadger.com/badges/image/minidocks/dbcli:pgcli.svg)](https://microbadger.com/images/minidocks/dbcli:pgcli)
 mycli | [![](https://images.microbadger.com/badges/image/minidocks/dbcli:mycli.svg)](https://microbadger.com/images/minidocks/dbcli:mycli)
 litecli    | [![](https://images.microbadger.com/badges/image/minidocks/dbcli:litecli.svg)](https://microbadger.com/images/minidocks/dbcli:litecli)
