Curl docker image ([minidocks/curl](https://hub.docker.com/r/minidocks/curl))
=============================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Curl-logo.svg/200px-Curl-logo.svg.png)

[Curl](https://curl.haxx.se/) is a command-line tool for transferring data
specified with URL syntax.

Utilities
---------

- [jq](https://stedolan.github.io/jq/) is a lightweight and flexible
  command-line JSON processor.
- [yq](https://mikefarah.gitbook.io/yq) is a lightweight and portable
  command-line YAML processor.
- [pup](https://github.com/ericchiang/pup) parsing HTML at the command line.
- [xmllint](https://gnome.pages.gitlab.gnome.org/libxml2/xmllint.html) command
  line XML tool.

Usage
-----

```bash
docker run --rm -it minidocks/curl http://example.com | pup 'h1 text{}'
```

Tags
----

| Tag     | Size                                                                                                         |
|---------|--------------------------------------------------------------------------------------------------------------|
| latest | ![](https://img.shields.io/docker/image-size/minidocks/curl/latest?style=flat-square&logo=docker&label=size) |
