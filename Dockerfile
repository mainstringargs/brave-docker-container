FROM ubuntu:14.04
RUN apt-get update && apt-get install -y x11-xserver-utils && apt-get install -y curl && apt-get install -y dbus-x11 && apt-get install --force-yes  -y apt-transport-https
RUN curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
RUN sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com `lsb_release -sc` main" >> /etc/apt/sources.list.d/brave.list'
RUN apt-get update && apt-get install -y brave-browser brave-keyring
CMD /usr/bin/brave-browser --no-sandbox