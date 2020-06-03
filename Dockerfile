# pull official base image
FROM python:3.8.1-alpine
LABEL maintainer="Philip <kumryung@gmail.com>"
LABEL version="v0.0.2"

# set work directory
WORKDIR /usr/src

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy requirements file
COPY ./requirements.txt /usr/src/init/requirements.txt

# install dependencies
RUN set -eux \
    && apk add --no-cache --virtual .build-deps build-base \
        libressl-dev libffi-dev gcc musl-dev python3-dev \
        postgresql-dev mariadb-dev git \
    && pip install --upgrade pip setuptools wheel \
    && pip install -r /usr/src/init/requirements.txt \
    && rm -rf /root/.cache/pip
