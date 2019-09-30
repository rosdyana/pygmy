FROM python:3.7-alpine

ARG PIP3="/root/code/bin/pip3"

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
        gcc
     
RUN mkdir /var/log/pygmy

WORKDIR /pygmy
RUN python3.7 -m venv /root/code
RUN ${PIP3} install -U pip
RUN ${PIP3} install \
        attrs==17.4.0\
        bcrypt==3.1.6\
        certifi==2018.1.1\
        cffi==1.11.4\
        chardet==3.0.4\
        click==6.7\
        Django==2.2.4\
        Flask==1.0.2\
        Flask-Cors==3.0.3\
        Flask-JWT-Extende\
        geoip2==2.7.0\
        gunicorn==19.7.1\
        idna==2.6\
        itsdangerous==0.2\
        Jinja2==2.10.1\
        MarkupSafe==1.0\
        marshmallow==2.16\
        maxminddb==1.3.0\
        passlib==1.7.1\
        pluggy==0.6.0\
        psycopg2==2.7.6.1\
        py==1.5.2\
        pycparser==2.18\
        PyJWT==1.5.3\
        pytest==3.4.0\
        pytz==2017.3\
        requests==2.22.0\
        six==1.11.0\
        SQLAlchemy==1.3.3\
        urllib3==1.25.3\
        Werkzeug==0.15.3\
ADD . /pygmy

EXPOSE 8000

CMD ["python3", "run.py"]
