Deployer docker image (minidocks/deployer)
==========================================

![](https://i0.wp.com/phpmagazine.net/wp-content/uploads/2018/11/php-deployer.png?resize=292%2C236&ssl=1)

Deployer is a deployment tool for PHP.

Usage
-----

```bash
docker run --rm -v `pwd`:/app -w /app minidocks/deployer init
docker run --rm -v `pwd`:/app -w /app minidocks/deployer deploy
```

Tags
----

 Tag       | Size
 --------- | ----
 latest, 6 | ![](https://img.shields.io/docker/image-size/minidocks/deployer/latest?style=flat-square&logo=docker&label=size)
 6         | ![](https://img.shields.io/docker/image-size/minidocks/deployer/6?style=flat-square&logo=docker&label=size)
 4         | ![](https://img.shields.io/docker/image-size/minidocks/deployer/4?style=flat-square&logo=docker&label=size)

