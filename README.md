Mini Docker Containers (Minidocks)
==================================

![](minidocks.png)

The smallest possible images for tools and programming languages.All images contain
[`tini`](https://github.com/docker-library/official-images#init), `su-exec` and `docker-exec`.

- http://www.projectatomic.io/docs/docker-image-author-guidance/

Handling user permissions
-------------------------

    docker run --rm -e SUEXEC=$(id -u):$(id -g) <minidocks/image> sh

- https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

Images
------

<table>
<tr>
  <td>Base</td><td>webuni/base</td><td>3.4, latest</td>
  <td><a href="https://imagelayers.io/?images=webuni/base:3.4"><img src="https://badge.imagelayers.io/webuni/base:3.4.svg"></a></td>
<tr>
<tr>
  <td>Ghoststript</td><td>webuni/ghostscript</td><td>9, latest</td>
  <td><a href="https://imagelayers.io/?images=webuni/ghostscript:9"><img src="https://badge.imagelayers.io/webuni/ghostscript:9.svg"></a></td>
<tr>
<tr>
  <td>ImageMagick</td><td>webuni/imagemagick</td><td>6, latest</td>
  <td><a href="https://imagelayers.io/?images=webuni/imagemagick:6"><img src="https://badge.imagelayers.io/webuni/imagemagick:6.svg"></a></td>
<tr>
<tr>
  <td>LaTeX, TeX, PDF</td><td>webuni/tex</td><td>2016, latest</td>
  <td><a href="https://imagelayers.io/?images=webuni/tex:2016"><img src="https://badge.imagelayers.io/webuni/tex:2016.svg"></a></td>
<tr>
<tr>
  <td>Python</td><td>webuni/python</td><td>2.7</td>
  <td><a href="https://imagelayers.io/?images=webuni/python:2.7"><img src="https://badge.imagelayers.io/webuni/python:2.7.svg"></a></td>
<tr>
<tr>
  <td>Python3</td><td>webuni/python</td><td>3.5</td>
  <td><a href="https://imagelayers.io/?images=webuni/python:3.5"><img src="https://badge.imagelayers.io/webuni/python:3.5.svg"></a></td>
<tr>
<tr>
  <td>Adminer</td><td>webuni/adminer</td><td>4.2, latest</td>
  <td><a href="https://imagelayers.io/?images=webuni/adminer:4.2"><img src="https://badge.imagelayers.io/webuni/adminer:4.2.svg"></a></td>
<tr>
<tr>
  <td>Redis</td><td>webuni/redis</td><td>3.2, latest</td>
  <td><a href="https://imagelayers.io/?images=webuni/redis:3.2"><img src="https://badge.imagelayers.io/webuni/redis:3.2.svg"></a></td>
<tr>
</table>

