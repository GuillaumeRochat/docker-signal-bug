FROM debian:latest
COPY ./start.sh /usr/src/app/
CMD ["/usr/src/app/start.sh"]
