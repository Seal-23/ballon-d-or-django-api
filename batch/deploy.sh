#!/bin/sh
ls -l
export DJANGO_ENV = prod
export DATABASE_PASSWORD = $1
if [ -d "./ballon-d-or-django-api" ]
then
    cd ballon-d-or-django-api
    git pull origin main
else
    git clone https://github.com/Seal-23/ballon-d-or-django-api.git
    cd ballon-d-or-django-api
fi
if [-d "./env"]
then
    source env/bin/activate
else
    python3 -m venv env
    source env/bin/activate
fi
pip install -r requirements.txt
python3 manage.py collectstatic
python3 manage.py migrate
gunicorn --bind 0.0.0.0:8000 --pid=/var/run/ballondor.pid ballondor.wsgi --daemon


