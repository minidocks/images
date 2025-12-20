OpenSSH docker image (minidocks/openssh)
========================================

![](https://upload.wikimedia.org/wikipedia/en/6/65/OpenSSH_logo.png)

[OpenSSH](https://www.openssh.com/) is a suite of secure networking utilities
based on the Secure Shell (SSH) protocol, which provides a secure channel over
an unsecured network in a client–server architecture.

Usage
-----

```bash
docker run --rm -it -v"`pwd`:/app" -w /app minidocks/openssh sh
```

Tags
----

| Tag    | Size                                                                                                            |
|--------|-----------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/openssh/latest?style=flat-square&logo=docker&label=size) |
