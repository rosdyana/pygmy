FROM python:3.7-alpine

ARG PIP3="/root/site/bin/pip3"

LABEL name='pygmy'
LABEL version='1.0.0'
LABEL description='Pygmy(pygy.co) URL shortener'
LABEL vendor="Amit Tripathi"

RUN  apk update --no-cache && \
        apk add --virtual\
        .build-deps \
        build-base \
        postgresql-client \
        postgresql-dev \
        bash \
        gfortran \
        gettext \
        gettext-dev \
        freetype-dev \
        openblas-dev \
        musl-dev \
        libffi-dev \
        libpng-dev \
        jpeg-dev \
        zlib-dev \
        gcc
     
RUN mkdir /var/log/pygmy

WORKDIR /pygmy
ADD ./requirements.txt /pygmy/requirements.txt
RUN ${PIP3} install -r requirements.txt
ADD . /pygmy

EXPOSE 8000

CMD ["python3", "run.py"]
