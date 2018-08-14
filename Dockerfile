FROM python:2-alpine

# install vaurien
RUN apk add --no-cache \
        gcc \
    musl-dev
RUN pip install vaurien

# install httpbin
RUN apk add --no-cache \
        libffi-dev \
        build-base
RUN pip install httpbin gunicorn

# install supervisord
RUN apk add --no-cache \
    supervisor

COPY ./assets /
CMD [ "/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf" ]
EXPOSE 80
