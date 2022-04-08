# opencv docker with ffmpeg and Qt

This is a opencv docker for development.

- Base ubuntu:focal
- opencv:4.5.5
- opencv_contrib:4.5.5

```bash
xhost +local:docker
docker run -it -v /tmp/.x11-unix:/tmp/.x11-unix -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE --net=host --device=/dev/video0 --name opencv_dev opencv:latest
```
