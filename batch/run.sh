#!/bin/sh
echo $DATABASE_PASSWORD
python manage.py migrate
gunicorn --bind 0.0.0.0:$PORT --pid=./ballondor.pid ballondor.wsgi --daemon
tail -f requirements.txt


