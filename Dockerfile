FROM lsiobase/rdesktop:focal

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
 echo "**** install packages ****" && \
 curl -s https://packagecloud.io/install/repositories/immortal/immortal/script.deb.sh | sudo bash && \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive && \ 
 apt-get install --no-install-recommends -y \
 	wget \
	libterm-readline-gnu-perl \
 	xdg-utils \
	xdg-user-dirs \
	libnss3 \
	firefox \
	pavucontrol \
	terminator \
	xfce4 \
	xfce4-goodies \
	xubuntu-default-settings \	
	xubuntu-icon-theme \
	immortal && \
 echo "**** cleanup ****" && \
 apt-get autoclean && \
 rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*

# add local files
COPY /root /
