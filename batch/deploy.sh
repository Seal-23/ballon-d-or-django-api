#!/bin/sh
ls -l
echo 1
export DJANGO_ENV = prod
export DATABASE_PASSWORD = $1
if [ -d "./ballon-d-or-django-api" ]
then
    echo 2
    cd ballon-d-or-django-api
    git pull origin main
else
    echo 3
    git clone https://github.com/Seal-23/ballon-d-or-django-api.git
    cd ballon-d-or-django-api
fi
if [-d "./env"]
then
    echo 4
    source env/bin/activate
else
    echo 5
    python3 -m venv env
    source env/bin/activate
fi
echo 6
pip install -r requirements.txt
echo 7
python3 manage.py collectstatic
echo 8
python3 manage.py migrate
echo 9
gunicorn --bind 0.0.0.0:8000 --pid=/var/run/ballondor.pid ballondor.wsgi --daemon
echo 10



