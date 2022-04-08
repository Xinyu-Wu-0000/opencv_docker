FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

COPY ./opencv-4.5.5.zip /home/
COPY ./opencv_contrib-4.5.5.zip /home/

ARG http_proxy=http://172.17.0.1:1080
ARG https_proxy=http://172.17.0.1:1080

RUN apt -y update \
    && apt -y upgrade \
    && apt -y install --no-install-recommends unzip \
    build-essential \
    cmake \
    gdb \
    git \
    python3\
    libdc1394-25\
    libdc1394-dev  \
    pkg-config \
    libgstreamer1.0-0 \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-0 \
    libgstreamer-plugins-base1.0-dev \
    libgtk-3-dev \
    qt5-default \
    libeigen3-dev \
    libtbb2 \
    libtbb-dev \
    libatlas-base-dev \
    libjpeg8-dev \
    libpng-dev \
    libxine2 \
    libxine2-dev \
    x11-apps \
    libavcodec58\
    libavcodec-dev\
    libavformat58 \
    libavformat-dev \
    libavutil56 \
    libavutil-dev \
    libavresample4 \
    libavresample-dev \
    libswscale5 \
    libswscale-dev \
    && cd /home \
    && unzip opencv-4.5.5.zip \
    && unzip opencv_contrib-4.5.5.zip \
    && mkdir build\
    && cd build \
    && cmake ../opencv-4.5.5 \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.5.5/modules \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_FFMPEG=ON \
    -D WITH_QT=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_OPENGL=ON \
    -D ENABLE_FAST_MATH=1 \
    -D WITH_IPP=ON \
    -D WITH_TBB=ON \
    -D WITH_TIFF=ON \
    -D WITH_EIGEN=ON \
    -D WITH_PNG=ON \
    -D WITH_JPEG=ON \
    -D WITH_XINE=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    && make -j12 \
    && make install \
    && ldconfig -v \
    && apt -y purge unzip \
    libatlas-base-dev \
    libgtk-3-dev \
    libeigen3-dev \
    libtbb-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libavresample-dev \
    libswscale-dev \
    libdc1394-dev \
    libjpeg8-dev \
    libxine2-dev \
    && apt autoremove -y \
    && apt autoclean -y \
    && rm -rf /home/opencv-4.5.5.zip \
    && rm -rf /home/opencv_contrib-4.5.5.zip \
    && rm -rf /home/opencv-4.5.5 \
    && rm -rf /home/opencv_contrib-4.5.5 \
    && rm -rf /home/build