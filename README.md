# opencv docker with ffmpeg and Qt

This is a opencv docker for development.

tag:latest:

- Base ubuntu:focal
- opencv:4.5.5
- opencv_contrib:4.5.5

You may want to run it like this:

```bash
xhost +local:docker
docker run -it -v /tmp/.x11-unix:/tmp/.x11-unix -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE --net=host --device=/dev/video0 --name opencv_dev opencv:latest
```

Pull it from the [Dockerhub](https://hub.docker.com/r/xinyu0000/opencv)

```bash
docker pull xinyu0000/opencv
```
