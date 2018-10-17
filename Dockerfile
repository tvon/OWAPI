# Python 3.7 errors on 'ensure_future = asyncio.async' in aiohttp/helpers.py
FROM python:3.6

RUN apt-get update \
      && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      build-essential \
      libxslt-dev \
      pkg-config \
      python3-dev \
      zlib1g-dev

RUN pip install pipenv

WORKDIR /app

ADD . /app/
RUN pipenv install

ENV PYTHONPATH=/app
CMD ["pipenv", "run", "asphalt", "run", "config.docker.yml"]
