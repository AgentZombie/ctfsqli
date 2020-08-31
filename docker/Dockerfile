FROM debian:latest

ADD work/ctfsqli /home/ctfsqli/ctfsqli
RUN useradd ctfsqli
RUN chown ctfsqli:ctfsqli /home/ctfsqli
ADD --chown=ctfsqli:ctfsqli work/ctf.db /home/ctfsqli/ctf.db
ADD templates/ /home/ctfsqli/templates

ENV LISTEN=:8000
ENV DB_FILE=/home/ctfsqli/ctf.db
ENV TEMPLATE_DIR=/home/ctfsqli/templates
ENV TARGET_FLAG=flag:foobar

EXPOSE 8000/tcp

ENTRYPOINT ["/home/ctfsqli/ctfsqli"]