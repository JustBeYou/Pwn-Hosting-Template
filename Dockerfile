ARG UBUNTU_VERSION

FROM ubuntu:$UBUNTU_VERSION

# install dependinces
# add lib32z1 for 32-bit support
# CUSTOMIZE: dependinces
RUN apt update && apt upgrade -y && apt install -y apt-utils xinetd libseccomp2

# challenge user and home 
ENV CHALL_USER=ctf
ENV CHALL_PATH=/home/$CHALL_USER
RUN useradd -m $CHALL_USER

WORKDIR $CHALL_PATH

# chall files and flag
COPY dist/* ./
RUN chown -R root:$CHALL_USER $(pwd) && \
    chmod -R 650 $(pwd)

COPY flag.txt ./
RUN chown root:$CHALL_USER ./flag.txt && \
    chmod 640 ./flag.txt

# prepare xinetd
COPY ./conf/chall.xinetd /etc/xinetd.d/chall
COPY ./conf/start.sh /start.sh
RUN echo "Blocked by xinetd" > /etc/banner_fail && chmod +x /start.sh

EXPOSE 2000
CMD ["/start.sh"]
