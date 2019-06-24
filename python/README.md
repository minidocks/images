Python docker image (minidocks/python)
======================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Python_logo_and_wordmark.svg/320px-Python_logo_and_wordmark.svg.png)

[Python](https://www.python.org/) is an interpreted, high-level, general-purpose programming language.

Configuration by environment variables
--------------------------------------

- `VENV_PATH` - Path to a virtual environment that will be activated after the start.
- `PIP_CACHE_DIR` (default `/pip-cache`) - Path to directory with pip cache.
- `PIP_NO_COMPILE` (default 1)

Utilities
---------

- `pyclean` - Remove all `.pyc`, `.pyo` and `__pycache__` files from directory (default `/`).

uWSGI
-----

uWSGI is used for serving Python web applications in conjunction with web servers Nginx, which offer direct support for
uWSGI's native uwsgi protocol.

Tags
----

 Tag       | Size
---------- | ----
 latest    | [![](https://images.microbadger.com/badges/image/minidocks/python.svg)](https://microbadger.com/images/minidocks/python)
 3.6       | [![](https://images.microbadger.com/badges/image/minidocks/python:3.6.svg)](https://microbadger.com/images/minidocks/python:3.6)
 3.6-uwsgi | [![](https://images.microbadger.com/badges/image/minidocks/python:3.6-uwsgi.svg)](https://microbadger.com/images/minidocks/python:3.6-uwsgi)
 3.5       | [![](https://images.microbadger.com/badges/image/minidocks/python:3.5.svg)](https://microbadger.com/images/minidocks/python:3.5)
 2.7       | [![](https://images.microbadger.com/badges/image/minidocks/python:2.7.svg)](https://microbadger.com/images/minidocks/python:2.7)

Related images
--------------

- [PyInstaller](https://github.com/minidocks/pyinstaller)
