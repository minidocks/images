GIMP docker image (webuni/gimp)
===============================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/The_GIMP_icon_-_gnome.svg/100px-The_GIMP_icon_-_gnome.svg.png)

GIMP is a cross-platform image editor.

Features
--------

- Additional directory for user scripts, brushes, gradients etc. is `/gimp`.

Usage
-----

- **Batch mode**

  Let make a simple script e.g. `~/unsharp.scm` with content:
  ```scheme
  (define (simple-unsharp-mask filename radius amount threshold)
     (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
            (drawable (car (gimp-image-get-active-layer image)))
            (buffer (vector ""))
            (output "/app/"))
       (plug-in-unsharp-mask RUN-NONINTERACTIVE
                         image drawable radius amount threshold)
       (re-match "([^/]+)$" filename buffer)
       (set! output (string-append output (substring filename (car (vector-ref buffer 0)))))
       (gimp-file-save RUN-NONINTERACTIVE image drawable output output)
       (gimp-image-delete image)))
  ```

  Then run command:
  ```bash
  docker run --rm -v `pwd`:/app -w /app -v ~/unsharp.scm:/gimp/scripts/unsharp.scm webuni/gimp \
      -i -b '(simple-unsharp-mask "/usr/share/gimp/2.0/images/gimp-splash.png" 5.0 0.5 0)' -b '(gimp-quit 0)'
  ```

  And in you working directory is the processed image.

- **Run GUI**
  ```bash
  xhost +
  docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/app -w /app webuni/gimp
  ```

Tags
----

 Tag          | Size
 ---          | ----
 latest, 2.10 | [![](https://images.microbadger.com/badges/image/webuni/gimp.svg)](https://microbadger.com/images/webuni/gimp)
 2.10         | [![](https://images.microbadger.com/badges/image/webuni/gimp:2.10.svg)](https://microbadger.com/images/webuni/gimp:2.10)
 2.8          | [![](https://images.microbadger.com/badges/image/webuni/gimp:2.8.svg)](https://microbadger.com/images/webuni/gimp:2.8)
