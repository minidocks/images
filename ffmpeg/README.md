FFmpeg docker image ([minidocks/ffmpeg](https://hub.docker.com/r/minidocks/ffmpeg))
===================================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/FFmpeg_Logo_new.svg/320px-FFmpeg_Logo_new.svg.png)

[FFmpeg](https://ffmpeg.org/) is a complete, cross-platform solution to record,
convert and stream audio and video.

Usage
-----

```bash
docker run --rm -it -v `pwd`:/app -w /app minidocks/ffmpeg \
 -hide_banner -i https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4
```

Tags
----

| Tag       | Size                                                                                                           |
|-----------|----------------------------------------------------------------------------------------------------------------|
| latest, 4 | ![](https://img.shields.io/docker/image-size/minidocks/ffmpeg/latest?style=flat-square&logo=docker&label=size) |
| 4         | ![](https://img.shields.io/docker/image-size/minidocks/ffmpeg/4?style=flat-square&logo=docker&label=size)      |
