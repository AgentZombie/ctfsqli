FROM debian:latest

ADD work/ctfsqli /ctfsqli
ADD --chown=nobody:nogroup work/ctf.db ctf.db
ADD templates/ /templates

ENV LISTEN=:8000
ENV DB_FILE=ctf.db
ENV TEMPLATE_DIR=/templates
ENV TARGET_FLAG=flag:foobar

EXPOSE 8000/tcp

ENTRYPOINT ["/ctfsqli"]