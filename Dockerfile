FROM alpine:3.16.0
# https://openwrt.org/docs/guide-developer/build-system/install-buildsystem#alpine
RUN apk add --update asciidoc \
  bash \
  bc \
  binutils \
  bzip2 \
  cdrkit \
  coreutils \
  diffutils \
  findutils \
  flex \
  g++ \
  gawk \
  gcc \
  gettext \
  git \
  grep \
  intltool \
  libxslt \
  linux-headers \
  make \
  ncurses-dev \
  openssl-dev \
  patch \
  perl \
  # python2-dev \
  python3-dev \
  rsync \
  tar \
  unzip \
  util-linux \
  wget \
  zlib-dev \
# https://openwrt.org/docs/guide-developer/build-system/install-buildsystem#prerequisites
  help2man \
  elfutils-dev elfutils \
  zlib \
  ncurses \
  openssl \
  # python2 \
  python3 \
# https://github.com/openwrt/openwrt/blob/master/README.md
  libc-dev \
  subversion \
  which \
# libelf
	argp-standalone \
  fts-dev \
  musl-obstack-dev \
  musl-libintl
# https://openwrt.org/docs/guide-developer/build-system/install-buildsystem#prerequisites
RUN apk add time perl-extutils-makemaker --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing
# RUN apk add libelf-dev libelf --repository=https://dl-cdn.alpinelinux.org/alpine/v3.9/main
RUN adduser -D ng
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"
COPY --chown=ng:ng . /home/ng/openwrt
USER ng
WORKDIR /home/ng/openwrt
RUN ./scripts/feeds update -a \
  && ./scripts/feeds install -a \
  && cp diffconfig .config \
  # && make defconfig
  && make defconfig \
  && make -j$(nproc) \
  && make clean
CMD ./scripts/feeds update -a \
&& ./scripts/feeds install -a \
make
