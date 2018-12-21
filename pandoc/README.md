Pandoc docker image (webuni/pandoc)
===================================

Pandoc is a document converter, widely used as a writing tool (especially by scholars) and as a basis for publishing
workflows.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app webuni/pandoc http://pandoc.org/MANUAL.html -t markdown
```

Tags
----

 Tag         | Size
 ----------- | ----
 latest, 2.5 | [![](https://images.microbadger.com/badges/image/webuni/pandoc.svg)](https://microbadger.com/images/webuni/pandoc)
 2.5         | [![](https://images.microbadger.com/badges/image/webuni/pandoc:2.5.svg)](https://microbadger.com/images/webuni/pandoc:2.5)
 2.4         | [![](https://images.microbadger.com/badges/image/webuni/pandoc:2.4.svg)](https://microbadger.com/images/webuni/pandoc:2.4)
 2.3         | [![](https://images.microbadger.com/badges/image/webuni/pandoc:2.3.svg)](https://microbadger.com/images/webuni/pandoc:2.3)
