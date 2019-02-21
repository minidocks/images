Base image (minidocks/base)
===========================

The best docker container for developers. This is a very small container (total 7.5 Mb) based on Alpine image.

Inspiration:
- https://github.com/CraftDock/alpine-base
- https://github.com/just-containers/s6-overlay

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

 Tag         | Size
 ---         | ----
 latest, 3.9 | [![](https://images.microbadger.com/badges/image/minidocks/base.svg)](https://microbadger.com/images/minidocks/base)
 edge        | [![](https://images.microbadger.com/badges/image/minidocks/base:edge.svg)](https://microbadger.com/images/minidocks/base:edge)
 3.9         | [![](https://images.microbadger.com/badges/image/minidocks/base:3.9.svg)](https://microbadger.com/images/minidocks/base:3.9)
 3.9-build   | [![](https://images.microbadger.com/badges/image/minidocks/base:3.9-build.svg)](https://microbadger.com/images/minidocks/base:3.9-build)
 3.8         | [![](https://images.microbadger.com/badges/image/minidocks/base:3.8.svg)](https://microbadger.com/images/minidocks/base:3.8)
 3.8-build   | [![](https://images.microbadger.com/badges/image/minidocks/base:3.8-build.svg)](https://microbadger.com/images/minidocks/base:3.8-build)
 3.7         | [![](https://images.microbadger.com/badges/image/minidocks/base:3.7.svg)](https://microbadger.com/images/minidocks/base:3.7)
 3.6         | [![](https://images.microbadger.com/badges/image/minidocks/base:3.6.svg)](https://microbadger.com/images/minidocks/base:3.6)
 3.5         | [![](https://images.microbadger.com/badges/image/minidocks/base:3.5.svg)](https://microbadger.com/images/minidocks/base:3.5)

Inspiration
-----------

- https://github.com/thecodingmachine/docker-images-php


https://ypereirareis.github.io/blog/2015/12/01/docker-container-external-links-alias-hosts-unavailable/
https://jtreminio.com/blog/running-docker-containers-as-current-host-user
