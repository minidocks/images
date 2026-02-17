PHP docker image ([minidocks/frankenphp](https://hub.docker.com/r/minidocks/frankenphp))
========================================================================================

[FrankenPHP](https://frankenphp.dev/) is the Modern PHP App Server written in Go.

Configuration by environment variables
--------------------------------------

- `PHP_EXT_*=0/1` - enable/disable php extension (e.g. `PHP_EXT_XDEBUG=1`)
- `PHP_*=value` - set PHP configuration in `php.ini`
  (e.g. `PHP_MEMORY__LIMIT=0`)

Installed applications
----------------------

- [Composer](https://getcomposer.org/): Dependency Manager for PHP `composer1`
  and `composer2` (alias `composer`).
- [PsySH](https://psysh.org/): A runtime developer console, interactive debugger
  and REPL for PHP.

Modules
-------

| module           | 8.x | 8.5 | tag    |
|------------------|:---:|:---:|--------|
| apcu             |  ✓  |  ✓  | base   |
| bcmath           |  ✓  |  ✓  | latest |
| blackfire        |  ✓  |  ✓  | latest |
| calendar         |  ✓  |  ✓  | latest |
| cgi              |  ✓  |  ✓  | latest |
| ctype            |  ✓  |  ✓  | base   |
| curl             |  ✓  |  ✓  | base   |
| dom              |  ✓  |  ✓  | latest |
| exif             |  ✓  |  ✓  | latest |
| excimer          |  ✓  |  ✓  | latest |
| ffi              |  ✓  |  ✓  | latest |
| fileinfo         |  ✓  |  ✓  | latest |
| fpm              |  ✓  |  ✓  | latest |
| ftp              |  ✓  |  ✓  | latest |
| gd               |  ✓  |  ✓  | latest |
| gettext          |  ✓  |  ✓  | latest |
| gmp              |  ✓  |  ✓  | latest |
| iconv            |  ✓  |  ✓  | base   |
| imap             |  ✓  |  ✓  | base   |
| intl             |  ✓  |  ✓  | intl   |
| json             |  ✓  |  ✓  | base   |
| ldap             |  ✓  |  ✓  | latest |
| mbstring         |  ✓  |  ✓  | base   |
| memcached        |  ✓  |  ✓  | latest |
| mongodb          |  ✓  |  ✓  | latest |
| mysqli           |  ✓  |  ✓  | latest |
| mysqlnd          |  ✓  |  ✓  | latest |
| newrelic (amd64) |  ✓  |  ✓  | latest |
| opcache          |  ✓  |  ×  | latest |
| opentelemetry    |  ✓  |  ✓  | latest |
| openssl          |  ✓  |  ✓  | base   |
| pcntl            |  ✓  |  ✓  | base   |
| pcov             |  ✓  |  ✓  | base   |
| pdo_mysql        |  ✓  |  ✓  | latest |
| pdo_pgsq         |  ✓  |  ✓  | latest |
| pdo_sqlite       |  ✓  |  ✓  | latest |
| pgsql            |  ✓  |  ✓  | latest |
| phar             |  ✓  |  ✓  | base   |
| posix            |  ✓  |  ✓  | base   |
| protobuf         |  ✓  |  ✓  | latest |
| redis            |  ✓  |  ✓  | latest |
| session          |  ✓  |  ✓  | latest |
| simplexml        |  ✓  |  ✓  | latest |
| soap             |  ✓  |  ✓  | latest |
| sockets          |  ✓  |  ✓  | latest |
| sodium           |  ✓  |  ✓  | latest |
| sqlite3          |  ✓  |  ✓  | latest |
| tokenizer        |  ✓  |  ✓  | base   |
| xdebug           |  ✓  |  ✓  | latest |
| xml              |  ✓  |  ✓  | latest |
| xmlreader        |  ✓  |  ✓  | latest |
| xmlwriter        |  ✓  |  ✓  | latest |
| xsl              |  ✓  |  ✓  | latest |
| zip              |  ✓  |  ✓  | latest |

Usage
-----

Run interactive REPL:

```bash
docker run --rm -it -v `pwd`:`pwd` -w `pwd` minidocks/php
```

Tags
----

| Tag         | Size                                                                                                               |
|-------------|--------------------------------------------------------------------------------------------------------------------|
| latest, 8.5 | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/latest?style=flat-square&logo=docker&label=size) |
| 8.5-base    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.5-base?style=flat-square&logo=docker&label=size)      |
| 8.5         | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.5?style=flat-square&logo=docker&label=size)           |
| 8.5-intl    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.5-intl?style=flat-square&logo=docker&label=size)      |
| 8.4-base    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.4-base?style=flat-square&logo=docker&label=size)      |
| 8.4         | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.4?style=flat-square&logo=docker&label=size)           |
| 8.4-intl    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.4-intl?style=flat-square&logo=docker&label=size)      |
| 8.3-base    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.3-base?style=flat-square&logo=docker&label=size)      |
| 8.3         | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.3?style=flat-square&logo=docker&label=size)           |
| 8.3-intl    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.3-intl?style=flat-square&logo=docker&label=size)      |
| 8.2-base    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.2-base?style=flat-square&logo=docker&label=size)      |
| 8.2         | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.2?style=flat-square&logo=docker&label=size)           |
| 8.2-intl    | ![](https://img.shields.io/docker/image-size/minidocks/frankenphp/8.2-intl?style=flat-square&logo=docker&label=size)      |
