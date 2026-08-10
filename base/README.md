Base image ([minidocks/base](https://hub.docker.com/r/minidocks/base))
======================================================================

The best docker container for developers. This is a very small container
(total < 8 MB) based on Alpine image.

Alpine repositories
-------------------

All images have registered the following apk repositories:

- @edge ([@main](https://dl-cdn.alpinelinux.org/alpine/edge/main), [@community](https://dl-cdn.alpinelinux.org/alpine/edge/community), [@testing](https://dl-cdn.alpinelinux.org/alpine/edge/testing))
- @324 ([@main324](https://dl-cdn.alpinelinux.org/alpine/v3.24/main), [@community324](https://dl-cdn.alpinelinux.org/alpine/v3.24/community))
- @323 ([@main323](https://dl-cdn.alpinelinux.org/alpine/v3.23/main), [@community323](https://dl-cdn.alpinelinux.org/alpine/v3.23/community))
- @322 ([@main322](https://dl-cdn.alpinelinux.org/alpine/v3.22/main), [@community322](https://dl-cdn.alpinelinux.org/alpine/v3.22/community))
- @321 ([@main321](https://dl-cdn.alpinelinux.org/alpine/v3.21/main), [@community321](https://dl-cdn.alpinelinux.org/alpine/v3.21/community))

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
- [`wait-for`](https://github.com/eficode/wait-for)  Wait for another service to become available.
- [`libc6-compat`](https://musl.libc.org/) Compatibility libraries for glibc.
- [`flock`](https://linux.die.net/man/2/flock) File locker from util-linux.
- [`tzdata`](https://www.iana.org/time-zones) Timezone data
- [`musl-locales`](https://git.adelielinux.org/adelie/musl-locales/-/wikis/home) Locales support for musl.

Features
--------

### Host user id and group id

The base image matches your userid / groupid inside the container at runtime.

Inspiration:
- https://github.com/Graham42/mapped-uid-docker
- https://github.com/reduardo7/docker-host-user

Handling user permissions
-------------------------

    docker run --rm -e SUEXEC=$(id -u):$(id -g) <minidocks/image> sh

- https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
- https://boxboat.com/2017/07/25/fixuid-change-docker-container-uid-gid/
- https://github.com/reduardo7/docker-host-user

Process Supervision
-------------------

- https://github.com/nimmis/docker-alpine-micro
- http://jtimberman.housepub.org/blog/2012/12/29/process-supervision-solved-problem/
- https://github.com/rawmind0/alpine-monit/

escape
quote
https://stackoverflow.com/questions/15783701/which-characters-need-to-be-escaped-when-using-bash
http://www.etalabs.net/sh_tricks.html

SSH
---

Pregenerated keys by
dropbearkey -t ecdsa -f /etc/dropbear/dropbear_ecdsa_host_key
dropbearkey -t ed25519 -f /etc/dropbear/dropbear_ed25519_host_key

### rootfs

### ssh

### Timezone


### Wait
https://github.com/erikogan/wait4ports
https://raw.githubusercontent.com/eficode/wait-for/master/wait-for
https://raw.githubusercontent.com/CraftShell/wait-host/master/wait-host.sh
https://github.com/bash-suite/wait-host/blob/master/wait-host.sh
https://stackoverflow.com/questions/31746182/docker-compose-wait-for-container-x-before-starting-y/41854997#41854997
wget -O /usr/local/bin/wait https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait && chmod a+x /usr/local/bin/wait \

### Locales
https://github.com/gliderlabs/docker-alpine/issues/144

### Supervise

- https://github.com/bahamas10/vsv
- https://github.com/ido50/Svsh
- https://github.com/lecram/isv
- https://github.com/sigmonsays/runitcmd
- https://github.com/kskeigrshi/runitctl
- https://github.com/threefoldtech/zinit
- https://github.com/bitmeal/fission
- https://github.com/daltomi/xsv

- https://github.com/kosma/runit-docker
- https://github.com/cheshirecode/alpine-runit
- https://github.com/docker-suite/alpine-runit

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
- `TIMEZONE`:

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
 latest, 3.24      | ![](https://img.shields.io/docker/image-size/minidocks/base/latest?style=flat-square&logo=docker&label=size)
 build, 3.24-build | ![](https://img.shields.io/docker/image-size/minidocks/base/build?style=flat-square&logo=docker&label=size)
 edge              | ![](https://img.shields.io/docker/image-size/minidocks/base/edge?style=flat-square&logo=docker&label=size)
 edge-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/edge-build?style=flat-square&logo=docker&label=size)
 3.24              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.24?style=flat-square&logo=docker&label=size)
 3.24-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.24-build?style=flat-square&logo=docker&label=size)
 3.23              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.23?style=flat-square&logo=docker&label=size)
 3.23-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.23-build?style=flat-square&logo=docker&label=size)
 3.22              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.22?style=flat-square&logo=docker&label=size)
 3.22-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.22-build?style=flat-square&logo=docker&label=size)
 3.21              | ![](https://img.shields.io/docker/image-size/minidocks/base/3.21?style=flat-square&logo=docker&label=size)
 3.21-build        | ![](https://img.shields.io/docker/image-size/minidocks/base/3.21-build?style=flat-square&logo=docker&label=size)


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
