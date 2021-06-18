Python docker image ([minidocks/python](https://hub.docker.com/r/minidocks/python))
===================================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Python_logo_and_wordmark.svg/320px-Python_logo_and_wordmark.svg.png)

[Python](https://www.python.org/) is an interpreted, high-level, general-purpose
programming language.

Configuration by environment variables
--------------------------------------

-   `VENV_PATH` - Path to a virtual environment that will be activated after the
    start.
-   `PIP_CACHE_DIR` (default `/pip-cache`) - Path to directory with pip cache.
-   `PIP_NO_COMPILE` (default 1)
-   `PIPENV_VENV_IN_PROJECT` (default 1)

Utilities
---------

-   `pyclean` - Remove all `.pyc`, `.pyo` and `__pycache__` files from directory
    (default `/`).
-   [micropipenv](https://pypi.org/project/micropipenv/) - A lightweight wrapper
    for pip to support requirements.txt, Pipenv and Poetry lock files or
    converting them to pip-tools compatible output.

Packaging
---------

-   [twine](https://github.com/pypa/twine) - Utilities for interacting with PyPI
-   [pipenv](https://pipenv.pypa.io) - Python Dev Workflow for Humans
-   [poetry](https://python-poetry.org/) - Python packaging and dependency
    management made easy
-   [flit](https://flit.readthedocs.io)- Simple way to put Python packages and
    modules on PyPI

uWSGI
-----

uWSGI is used for serving Python web applications in conjunction with web
servers Nginx, which offer direct support for uWSGI’s native uwsgi protocol.

Tags
----

| Tag            | Size                                                                                |
|----------------|-------------------------------------------------------------------------------------|
| latest, 3, 3.8 | ![](https://img.shields.io/docker/image-size/minidocks/python/latest?style=flat-square&logo=docker&label=size)               |
| 3, 3.8         | ![](https://img.shields.io/docker/image-size/minidocks/python/3?style=flat-square&logo=docker&label=size)             |
| 3-packaging    | ![](https://img.shields.io/docker/image-size/minidocks/python/3-packaging?style=flat-square&logo=docker&label=size)   |
| 3-build        | ![](https://img.shields.io/docker/image-size/minidocks/python/3-build?style=flat-square&logo=docker&label=size)       |
| 3-uwsgi        | ![](https://img.shields.io/docker/image-size/minidocks/python/3-uwsgi?style=flat-square&logo=docker&label=size)       |
| 3.9            | ![](https://img.shields.io/docker/image-size/minidocks/python/3.9?style=flat-square&logo=docker&label=size)           |
| 3.9-packaging  | ![](https://img.shields.io/docker/image-size/minidocks/python/3.9-packaging?style=flat-square&logo=docker&label=size) |
| 3.9-build      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.9-build?style=flat-square&logo=docker&label=size)     |
| 3.9-uwsgi      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.9-uwsgi?style=flat-square&logo=docker&label=size)     |
| 3.8            | ![](https://img.shields.io/docker/image-size/minidocks/python/3.8?style=flat-square&logo=docker&label=size)           |
| 3.8-packaging  | ![](https://img.shields.io/docker/image-size/minidocks/python/3.8-packaging?style=flat-square&logo=docker&label=size) |
| 3.8-build      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.8-build?style=flat-square&logo=docker&label=size)     |
| 3.8-uwsgi      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.8-uwsgi?style=flat-square&logo=docker&label=size)     |
| 3.7            | ![](https://img.shields.io/docker/image-size/minidocks/python/3.7?style=flat-square&logo=docker&label=size)           |
| 3.7-packaging  | ![](https://img.shields.io/docker/image-size/minidocks/python/3.7-packaging?style=flat-square&logo=docker&label=size) |
| 3.7-build      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.7-build?style=flat-square&logo=docker&label=size)     |
| 3.7-uwsgi      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.7-uwsgi?style=flat-square&logo=docker&label=size)     |
| 3.6            | ![](https://img.shields.io/docker/image-size/minidocks/python/3.6?style=flat-square&logo=docker&label=size)           |
| 3.6-packaging  | ![](https://img.shields.io/docker/image-size/minidocks/python/3.6-packaging?style=flat-square&logo=docker&label=size) |
| 3.6-build      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.6-build?style=flat-square&logo=docker&label=size)     |
| 3.6-uwsgi      | ![](https://img.shields.io/docker/image-size/minidocks/python/3.6-uwsgi?style=flat-square&logo=docker&label=size)     |
| 2              | ![](https://img.shields.io/docker/image-size/minidocks/python/2?style=flat-square&logo=docker&label=size)             |
| 2-packaging    | ![](https://img.shields.io/docker/image-size/minidocks/python/2-packaging?style=flat-square&logo=docker&label=size)   |
| 2-build        | ![](https://img.shields.io/docker/image-size/minidocks/python/2-build?style=flat-square&logo=docker&label=size)       |
| 2.7            | ![](https://img.shields.io/docker/image-size/minidocks/python/2.7?style=flat-square&logo=docker&label=size)           |
| 2.7-packaging  | ![](https://img.shields.io/docker/image-size/minidocks/python/2.7-packaging?style=flat-square&logo=docker&label=size) |
| 2.7-build      | ![](https://img.shields.io/docker/image-size/minidocks/python/2.7-build?style=flat-square&logo=docker&label=size)     |

Related images
--------------

-   [PyInstaller](https://github.com/minidocks/pyinstaller)
