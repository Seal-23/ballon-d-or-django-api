#!/bin/bash
function deploy {
    echo prueba > ./insidesh
    cd ..
    ls
}
deploy
# gcloud compute ssh --zone "us-central1-c" "ballon-d-or-django-api"  --project "ballon-d-or-django-api-public" --command "deploy"
# export DJANGO_ENV=prod
# export DATABASE_PASSWORD=$1
# echo working
# if [ -d "./ballon-d-or-django-api" ]
# then
#     cd ballon-d-or-django-api
#     git pull origin main
# else
#     git clone https://github.com/Seal-23/ballon-d-or-django-api.git
#     cd ballon-d-or-django-api
#     echo $DATABASE_PASSWORD > ./test
#     ls
# fi
# if [ -d "./env" ]
# then
#     echo existeEnv
#     . env/bin/activate
# else
#     echo NOexisteEnv
#     python3 -m venv env
#     . env/bin/activate
# fi
# pip install -r requirements.txt
# if ! [[ -d "./static" ]]
# then
# python3 manage.py collectstatic
# fi
# ls
# python3 manage.py migrate
# if [ -f "./ballondor.pid" ]
# then
#     while kill $(cat ./ballondor.pid); do
#         sleep 1
#     done
# fi
# gunicorn --bind 0.0.0.0:8000 --pid=./ballondor.pid ballondor.wsgi --daemon


