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

#RUN \
# echo "Preparing to install Cubbit"; \
# download_folder=$(echo $HOME/cubbit_download); \
# config_path=$(echo $HOME/cubbit_cache); \
# mkdir -p $download_folder; \
# mkdir -p $config_path; \
# touch -a "$config_path/cubbit_version.txt"; \
# previous_version=$(cat "$config_path/cubbit_version.txt")

#RUN \
# echo "[1] Check for cubbit version."; \
# if test -f "$download_folder/$previous_version"; \
# then echo "[2] Running $previous_version that already exists."; \
# 	$download_folder/$previous_version --no-sandbox; \
# else echo "[2] Downloading last version name."; \
# 	source=$(curl 'https://get.cubbit.io/desktop/linux/latest-linux.yml?script=linux&version=0.0.1'); \
# 	exec_name=$(echo "$source" | grep 'url' | awk 'BEGIN { ORS=" " }; {print $3}'|tr -d '[:space:]'); \
# 	echo "[3] Check if last Cubbit version exists."; \
# 	if test -f "$download_folder/$exec_name"; \
#	then echo "[4] Storing new version name in $config_path"; \
#        	mkdir -p $config_path; \
#        	echo "$exec_name" > "$config_path/cubbit_version.txt"; \
#        	echo "[5] Running $exec_name."; \
#        	$download_folder/$exec_name --no-sandbox; \
# 	else echo "[2] Error $exec_name does not exists in $download_folder."; \
# 	fi; \
# fi
 
#RUN \
# echo "Cubbit installed"
 
# add local files
COPY /root /

ARG DOWNDIR="~"
ARG RUNFILE="Cubbit-7.2.2.AppImage"

#RUN \
# mkdir -p $DOWNDIR

RUN \
 echo "Downloading Cubbit Desktop"; \ 
 wget "https://get.cubbit.io/desktop/linux/$RUNFILE"
 #wget 'https://get.cubbit.io/desktop/linux/$RUNFILE' -O "/$RUNFILE"

#RUN mv $RUNFILE $DOWNDIR/

RUN sudo chmod a+x /$RUNFILE

RUN \
 echo "Starting Cubbit Desktop"; \
 su - abc -c "/$RUNFILE --appimage-extract-and-run & sleep 30"
 #bash -c "/$RUNFILE --appimage-extract-and-run & sleep 30"
 
 #bash -c "$DOWNDIR/$RUNFILE --appimage-extract-and-run & sleep 5 && tail -F /dev/null"

# ports and volumes
#EXPOSE 3389
#VOLUME /config
#VOLUME /data
