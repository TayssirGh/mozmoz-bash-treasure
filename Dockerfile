FROM opensuse/leap:latest
WORKDIR /usr/mozmoz-quest
RUN zypper install -y less
COPY . .
RUN chmod +x .welcome.sh
RUN ./.welcome.sh
ENTRYPOINT ["bash", "-c", "./.welcome.sh && exec bash"]