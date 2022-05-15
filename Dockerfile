FROM python:3.10-slim

ARG DATABASE_PASSWORD

ENV PYTHONUNBUFFERED True
ENV DJANGO_ENV prod
ENV DATABASE_PASSWORD $DATABASE_PASSWORD
ENV PORT 8000

# Copy local code to the container image.
COPY . /src
WORKDIR /src

RUN set -eux && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y default-libmysqlclient-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

RUN python manage.py collectstatic
RUN chmod +x ./batch/run.sh

# Run the web service on container startup. Here we use the gunicorn
CMD ./batch/run.sh

EXPOSE ${PORT}