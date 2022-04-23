FROM ubuntu:jammy

ENV DEBIAN_FRONTEND noninteractive

COPY ./opencv-4.5.5.zip /home/
COPY ./opencv_contrib-4.5.5.zip /home/

ARG http_proxy=http://172.17.0.1:1080
ARG https_proxy=http://172.17.0.1:1080

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get install -y software-properties-common \
    apt-utils \
    && add-apt-repository ppa:apt-fast/stable -y \
    && apt-get update -y \
    && apt-get -y install apt-fast \
    && apt-fast -y install --no-install-recommends unzip \
    build-essential \
    cmake \
    gdb \
    git \
    python3 \
    pkg-config \
    libdc1394-25\
    libdc1394-dev  \
    libgstreamer1.0-0 \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-0 \
    libgstreamer-plugins-base1.0-dev \
    libgtk-3-dev \
    libeigen3-dev \
    libtbb12 \
    libtbb-dev \
    libatlas-base-dev \
    libjpeg8 \
    libjpeg8-dev \
    libpng-dev \
    libpng16-16 \
    libpng++-dev \
    libxine2 \
    libxine2-dev \
    x11-apps \
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    qtbase5-dev-tools \
    libavcodec58\
    libavcodec-dev\
    libavformat58 \
    libavformat-dev \
    libavutil56 \
    libavutil-dev \
    libswresample3 \
    libswresample-dev \
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
    && apt-get -y purge unzip \
    libatlas-base-dev \
    libgtk-3-dev \
    libeigen3-dev \
    libtbb-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswresample-dev \
    libswscale-dev \
    libdc1394-dev \
    libjpeg8-dev \
    libxine2-dev \
    libpng-dev \
    libpng++-dev \
    software-properties-common \
    apt-fast \
    apt-utils \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && apt-get autoclean -y \
    && rm -rf /home/opencv-4.5.5.zip \
    && rm -rf /home/opencv_contrib-4.5.5.zip \
    && rm -rf /home/opencv-4.5.5 \
    && rm -rf /home/opencv_contrib-4.5.5 \
    && rm -rf /home/build
