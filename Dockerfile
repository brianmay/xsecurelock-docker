FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    autotools-dev \
    doxygen \
    libpam-dev \
    libx11-dev \
    libxcomposite-dev \
    libxext-dev \
    libxfixes-dev \
    libxft-dev \
    libxmuu-dev \
    libxrandr-dev \
    libxss-dev \
    git \
    xscreensaver \
    mplayer \
    mpv \
    pamtester \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch v1.7.0 https://github.com/google/xsecurelock.git /app
WORKDIR /app

RUN ls -l /app
RUN ./autogen.sh
RUN ./configure --with-pam-service-name=xscreensaver
RUN make
RUN rm -rf /usr/local
RUN make install
