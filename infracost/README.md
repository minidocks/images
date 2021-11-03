Infracost docker image ([minidocks/infracost](https://hub.docker.com/r/minidocks/infracost))
============================================================================================

![](https://www.infracost.io/img/logo.svg)

[Infracost](https://www.infracost.io/) exists to empower engineering teams to
use cloud infrastructure economically and efficiently

Usage
-----

We must connect infracost image with terraform image via the ssh protocol. The
easiest solution is to use docker compose.

So create a file `docker-compose.yml` with content:

```yaml
version: '3.6'

services:
  terraform:
    image: minidocks/terraform
    volumes:
      - .:$PWD
    working_dir: $PWD
    command: sshd

  infracost:
    image: minidocks/infracost
    depends_on:
      - terraform
    environment:
      ALIAS_TERRAFORM: ssh -yy terraform terraform
    volumes:
      - .:$PWD
    working_dir: $PWD
```

And in directory with terraform files run command:

```bash
docker-compose run --rm infracost breakdown --path .
```

Tags
----

| Tag    | Size                                                                                                              |
|--------|-------------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/infracost/latest?style=flat-square&logo=docker&label=size) |
