Base image ([minidocks/base](https://hub.docker.com/r/minidocks/base))
======================================================================

The best docker container for developers. This is a very small container
(total < 9 MB) based on Alpine image.

Alpine repositories
-------------------

All images have registered the following apk repositories:

- @edge ([@main](http://dl-cdn.alpinelinux.org/alpine/edge/main), [@community](http://dl-cdn.alpinelinux.org/alpine/edge/community), [@testing](http://dl-cdn.alpinelinux.org/alpine/edge/testing))
- @314 ([@main314](http://dl-cdn.alpinelinux.org/alpine/v3.14/main), [@community314](http://dl-cdn.alpinelinux.org/alpine/v3.14/community))
- @313 ([@main313](http://dl-cdn.alpinelinux.org/alpine/v3.13/main), [@community313](http://dl-cdn.alpinelinux.org/alpine/v3.13/community))
- @312 ([@main312](http://dl-cdn.alpinelinux.org/alpine/v3.12/main), [@community312](http://dl-cdn.alpinelinux.org/alpine/v3.12/community))
- …
- @37 ([@main37](http://dl-cdn.alpinelinux.org/alpine/v3.7/main), [@community37](http://dl-cdn.alpinelinux.org/alpine/v3.7/community))

Utilities
---------

All images contain the following extra packages:

- [`tini`](https://github.com/krallin/tini) A tiny but valid init for containers.
- [`monit`](http://mmonit.com/monit) Managing and monitoring on a UNIX system.
- [`inotify-tools`](https://github.com/rvoicilas/inotify-tools) CLI tools providing a simple interface to inotify.
- [`dropbear`](https://matt.ucc.asn.au/dropbear/dropbear.html) Small SSH 2 client/server designed for small memory environments.
- [`envsubst`](https://linux.die.net/man/1/envsubst) Substitutes environment variables in shell format strings.
- [`ca-certificates`](https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/) Common CA certificates PEM files.
- [`su-exec`](https://github.com/ncopa/su-exec) Switch user and group id, setgroups and exec.
- [`wait4ports`](https://github.com/erikogan/wait4ports) A small utility to wait for network peer availability.

Features
--------

### Host user id and group id

The base image matches your userid / groupid inside the container at runtime.

Inspiration:
- https://github.com/Graham42/mapped-uid-docker
- https://github.com/reduardo7/docker-host-user


### rootfs

### ssh

### Supervise

- https://github.com/bahamas10/vsv
- https://github.com/SwagDevOps/sv-utils
- https://github.com/cheshirecode/alpine-runit

Environment variables
---------------------

- `ALIAS_*`:
- `CLEAN`:
- `ENV_FILE`:
- `AUTO_CHOWN`:
- `PATH_PREFIX`:
- `PATH_SUFFIX`:
- `CRON_USER_*`:
- `CRON_SCHEDULE_*`:
- `CRON_COMMAND_*`:

- `STARTUP_COMMAND_*`:

- `FILE_*_PATH`:
- `FILE_*_CONTENT`:

- `SUEXEC`:
- `ID`:
- `USER_NAME`: **User name**. You can use `$USERNAME` to get current *user name*.
- `USER_ID`: **User ID**. You can use `$UID` to get current *user ID*.
- `GROUP_NAME`: **User group name**. You can use `$(id -g -n $USERNAME)` to get current *user group name*.
- `GROUP_ID`: **User group ID**. You can use `$(id -g $USERNAME)` to get current *user group ID*.
- `USER_SHELL`: User shell. Default value: `/bin/bash`.
- `USER_PASSWORD`: User password. Default value: `password`.
- `USER_MASK`: User mask.

- `PATH_HOME`: Default value: `/home/${HOST_USER_NAME}`.

https://github.com/hejack0207/empty.c
(sexpect)

Run GUI application
-------------------

```
xhost +
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/app -w /app minidocks/gimp
```

Tags
----

 Tag               | Size
 ---               | ----
 latest, 3.14      | ![](https://img.shields.io/docker/image-size/minidocks/base/latest?style=flat-square&logo=docker&label=size)
 edge              | ![](https://img.shields.io/docker/image-size/minidocks/base/edge?style=flat-square&logo=docker&label=size)
 3.14              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.14?style=flat-square&logo=docker&label=size)
 build, 3.14-build | ![](https://img.shields.io/docker/image-size/minidocks/base/3.14-build?style=flat-square&logo=docker&label=size)
 3.13              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.13?style=flat-square&logo=docker&label=size)
 build, 3.13-build | ![](https://img.shields.io/docker/image-size/minidocks/base/3.13-build?style=flat-square&logo=docker&label=size)
 3.12              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.12?style=flat-square&logo=docker&label=size)
 3.12-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.12-build?style=flat-square&logo=docker&label=size)
 3.11              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.11?style=flat-square&logo=docker&label=size)
 3.11-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.11-build?style=flat-square&logo=docker&label=size)
 3.10              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.10?style=flat-square&logo=docker&label=size)
 3.10-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.10-build?style=flat-square&logo=docker&label=size)
 3.9               | ![](https://img.shields.io/docker/image-size/minidocks/base/3.9?style=flat-square&logo=docker&label=size)
 3.9-build         | ![](https://img.shields.io/docker/image-size/minidocks/base/3.9-build?style=flat-square&logo=docker&label=size)
 3.8               | ![](https://img.shields.io/docker/image-size/minidocks/base/3.8?style=flat-square&logo=docker&label=size)
 3.8-build         | ![](https://img.shields.io/docker/image-size/minidocks/base/3.8-build?style=flat-square&logo=docker&label=size)
 3.7               | ![](https://img.shields.io/docker/image-size/minidocks/base/3.7?style=flat-square&logo=docker&label=size)

Inspiration
-----------

- https://github.com/just-containers/s6-overlay
- https://blog.iron.io/microcontainers-tiny-portable-containers/
- http://www.projectatomic.io/docs/docker-image-author-guidance/
- https://github.com/nimmis/docker-alpine-micro
- https://github.com/dockage/alpine
- https://github.com/docker-suite/alpine-base/

Alternatives
------------
- https://github.com/CraftDock/alpine-base
- https://github.com/thecodingmachine/docker-images-php
- https://github.com/bash-suite
- https://github.com/QuantumObject/docker-alpine


https://ypereirareis.github.io/blog/2015/12/01/docker-container-external-links-alias-hosts-unavailable/
https://jtreminio.com/blog/running-docker-containers-as-current-host-user
