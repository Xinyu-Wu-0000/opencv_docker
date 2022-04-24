# opencv docker with ffmpeg and Qt

This is a opencv docker for development.

tag:latest:

- Base ubuntu:jammy
- opencv:4.5.5
- opencv_contrib:4.5.5

tag:ubuntu_focal_opencv_4.5.5:

- Base ubuntu:focal
- opencv:4.5.5
- opencv_contrib:4.5.5

Pull it from the [Dockerhub](https://hub.docker.com/r/xinyu0000/opencv)

```bash
docker pull xinyu0000/opencv
```

You may want to run it like this(X11):

```bash
xhost +local:docker
docker run -it \
            -v /home/wuxinyu/Pictures/:/root/Pictures \
            -v /home/wuxinyu/Videos/:/root/Videos/ \
            -v /mnt/608AF1968AF168C4/Users/xinyu/Desktop/机器视觉/作业/:/root/homework \
            -v /tmp/.x11-unix:/tmp/.x11-unix \
            -e DISPLAY=$DISPLAY \
            -e GDK_SCALE \
            -e GDK_DPI_SCALE \
            --ipc=host \
            --net=host \
            --device=/dev/video0 \
            --name opencv_X11 \
            xinyu0000/opencv:latest
```

or this (Wayland)
```bash
docker run -it \
            -v /home/wuxinyu/Pictures/:/root/Pictures \
            -v /home/wuxinyu/Videos/:/root/Videos/ \
            -v /mnt/608AF1968AF168C4/Users/xinyu/Desktop/机器视觉/作业/:/root/homework \
            -e XDG_SESSION_TYPE=wayland \
            -e XDG_RUNTIME_DIR=/tmp \
            -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
            -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY  \
            -e QT_QPA_PLATFORM=wayland \
            -e GDK_BACKEND=wayland \
            -e CLUTTER_BACKEND=wayland \
            -e SDL_VIDEODRIVER=wayland \
            -e ELM_DISPLAY=wl \
            -e ELM_ACCEL=opengl \
            -e ECORE_EVAS_ENGINE=wayland_egl \
            --net=host \
            --device=/dev/video0 \
            --name opencv_wayland \
            xinyu0000/opencv:latest
```
