FROM opensuse/leap:latest
WORKDIR /usr/src/app
COPY . .
RUN chmod +x .welcome.sh
RUN ./.welcome.sh
ENTRYPOINT ["bash", "-c", "./.welcome.sh && exec bash"]