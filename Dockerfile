FROM lsiobase/rdesktop:focal

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 DEBIAN_FRONTEND=noninteractive \ 
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
	xubuntu-icon-theme && \
 echo "**** cleanup ****" && \
 apt-get autoclean && \
 rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*

ARG DOWNDIR="/config/Downloads"
ARG RUNFILE="Cubbit-7.2.2.AppImage"

RUN \
 wget "https://get.cubbit.io/desktop/linux/$RUNFILE" -O "/$RUNFILE" && \
 sudo chmod a+x "/$RUNFILE"

# add local files
COPY /root /

#RUN \
# mkdir -p $DOWNDIR

##USER abc

##ENTRYPOINT /bin/bash -c "/$RUNFILE --appimage-extract-and-run"

#RUN mv $RUNFILE $DOWNDIR/

#RUN sudo chmod a+x /$RUNFILE

#RUN echo "Starting Cubbit Desktop"

#RUN su - abc -c "/$RUNFILE --appimage-extract-and-run & sleep 30"
 #bash -c "/$RUNFILE --appimage-extract-and-run & sleep 30"
 
 #bash -c "$DOWNDIR/$RUNFILE --appimage-extract-and-run & sleep 5 && tail -F /dev/null"

# ports and volumes
#EXPOSE 3389
#VOLUME /config
#VOLUME /data
