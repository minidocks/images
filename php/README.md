PHP docker image (minidocks/php)
================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/200px-PHP-logo.svg.png)

[PHP](https://php.net/) is a popular general-purpose scripting language that is especially suited to web development.
Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.

Configuration by environment variables
--------------------------------------

- `PHP_EXT_*=0/1` - enable/disable php extension (e.g. `PHP_EXT_XDEBUG=1`)
- `PHP_*=value` - set PHP configuration in `php.ini` (e.g. `PHP_MEMORY__LIMIT=0`)
- `FPM_*=value` - set PHP FPM configuration in `php-fpm.conf` (e.g. `FPM_ERROR_LOG=/dev/stderr.pipe`)
- `FPM_WWW_*=value` - set PHP FPM configuration in `php-fpm.d/www.conf` (e.g. `FPM_WWW_ACCESS__LOG=/dev/stdout.pipe`)

Installed applications
----------------------

- [Composer](https://getcomposer.org/): Dependency Manager for PHP.
- [PsySH](https://psysh.org/): A runtime developer console, interactive debugger and REPL for PHP.

Usage
-----

Run interactive REPL:
```bash
docker run --rm -it -v `pwd`:`pwd` -w `pwd` minidocks/php
```

Tags
----

 Tag         | Size
 ----------- | ----
 latest, 7.3 | [![](https://images.microbadger.com/badges/image/minidocks/php.svg)](https://microbadger.com/images/minidocks/php)
 7.3-base    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.3-base.svg)](https://microbadger.com/images/minidocks/php:7.3-base)
 7.3         | [![](https://images.microbadger.com/badges/image/minidocks/php:7.3.svg)](https://microbadger.com/images/minidocks/php:7.3)
 7.3-intl    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.3-intl.svg)](https://microbadger.com/images/minidocks/php:7.3-intl)
 7.2-base    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.2-base.svg)](https://microbadger.com/images/minidocks/php:7.2-base)
 7.2         | [![](https://images.microbadger.com/badges/image/minidocks/php:7.2.svg)](https://microbadger.com/images/minidocks/php:7.2)
 7.2-intl    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.2-intl.svg)](https://microbadger.com/images/minidocks/php:7.2-intl)
 7.1-base    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.1-base.svg)](https://microbadger.com/images/minidocks/php:7.1-base)
 7.1         | [![](https://images.microbadger.com/badges/image/minidocks/php:7.1.svg)](https://microbadger.com/images/minidocks/php:7.1)
 7.1-intl    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.1-intl.svg)](https://microbadger.com/images/minidocks/php:7.1-intl)
 7.0-base    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.0-base.svg)](https://microbadger.com/images/minidocks/php:7.0-base)
 7.0         | [![](https://images.microbadger.com/badges/image/minidocks/php:7.0.svg)](https://microbadger.com/images/minidocks/php:7.0)
 7.0-intl    | [![](https://images.microbadger.com/badges/image/minidocks/php:7.0-intl.svg)](https://microbadger.com/images/minidocks/php:7.0-intl)
 5.6-base    | [![](https://images.microbadger.com/badges/image/minidocks/php:5.6-base.svg)](https://microbadger.com/images/minidocks/php:5.6-base)
 5.6         | [![](https://images.microbadger.com/badges/image/minidocks/php:5.6.svg)](https://microbadger.com/images/minidocks/php:5.6-intl)
 5.6-intl    | [![](https://images.microbadger.com/badges/image/minidocks/php:5.6-intl.svg)](https://microbadger.com/images/minidocks/php:5.6-intl)

See also
--------

- https://github.com/codecasts/php-alpine
